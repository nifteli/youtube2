<?php
session_start();
$sessionId = session_id();

require_once("../configs/paths.php");
require_once($confsPath."conf.php");
require_once($classesPath."MysqliDb.php");
require_once($classesPath."access.php");
$db = new MysqliDb($hostname, $username, $password, $database);
$lang = $_SESSION["lang"];
require_once($langsPath."content_".$lang.".php");
$access = new Access($db);

//Category subscriptions
if($_POST["action"] == "subs" && is_numeric($_POST["catId"]))
{
	if($_POST["flag"] ==1)
	{
		$db->insert("subscriptions",array(
								"userId"=>$_SESSION["userId"],
								"catId"=>$_POST["catId"],
								"subsDate"=>date("Y-m-d H:i:s")
								));
		$cnt = $db->count>0; //echo $db->getLastError();
	}
	else
	{
		$db->where("catId=$_POST[catId] and userId=".$_SESSION["userId"]);
		$cnt = $db->delete("subscriptions"); //echo $db->getLastError()." ".$db->getLastQuery();
	}
	if($cnt)
	{
		echo 1;
	}
}

if($_POST["action"] == "repVideo" && is_numeric($_POST["reasonId"]) && is_numeric($_POST["id"]) && trim($_POST["desc"]) != "")
{
	if(trim($_POST["id"]) > 0 && $_POST["reasonId"] > 0)
	{
		$db->where("videoId=".trim($_POST["id"])." and reporterId=".$access->userId);
		$db->get("videoreports");
		if($db->count>0)
		{
			$result = "error";
			echo $content["DUPLICATEREPORT"];
			return;
		}
		if(strlen(trim($_POST["desc"])) < 5)
		{
			$result = "error";
			echo  $content["SHORTDESC"];
			return;
		}
		
		$res = $db->insert("videoreports", array("videoId"=>trim($_POST["id"]),
												  "reasonId"=>$_POST["reasonId"],
												  "desc"=>trim($_POST["desc"]),
												  "reporterId"=>$access->userId,
												  "reportDate"=>date("Y-m-d H:i:s")));
		if($db->count > 0) 
		{
			$res = $db->rawQuery("select email,firstName,lastName from users
								where roleId in (select roleId from roleaccess where accessTypeId=58)");
								//print_r($res);
			for($i=0; $i<count($res); $i++)
			{
				if($res[$i]["email"] != "")
				{
					$db->rawQuery("insert into subsmails (sendTo,subject,body,status) values
							    ('" . $res[$i]["email"] . "','" . 
								$content["REPORTEMAILSUBJECT"] . "','" .
								base64_encode($content["REPORTEMAILBODY"].trim($_POST["id"])) . "',0)");
								;
				}
			}
			echo $content["REPORTSAVED"];
		}
		
	}
}

if($_GET["action"] == "subscribe" && $_GET["catId"] && is_numeric($_GET["catId"]))
{
	$db->insert("subscriptions",array(
								"userId"=>$_SESSION["userId"],
								"catId"=>$_GET["catId"],
								"subsDate"=>date("Y-m-d H:i:s")
								));
	if($db->count>0)
	{
		$subsCnt = $db->rawQuery("select count(*) cnt from subscriptions where catId=".$_GET["catId"]);
		echo " <span id='subs".$_GET["catId"]."'><a class='subscription'  id='".$_GET["catId"].":0'> [$content[UNSUBSCRIBE]]</a>(".$subsCnt[0]["cnt"].")</span>";
	}
}
//Category unsubscription
if($_GET["action"] == "unSubscribe" && $_GET["catId"] && is_numeric($_GET["catId"]))
{
	$qry = "delete from subscriptions 
				where catId = $_GET[catId] and userId=".$_SESSION["userId"];
		$db->rawQuery($qry);
		$subsCnt = $db->rawQuery("select count(*) cnt from subscriptions where catId=".$_GET["catId"]);	
		echo " <span id='subs".$_GET["catId"]."'><a class='subscription'  id='".$_GET["catId"].":1'> [$content[SUBSCRIBE]]</a>(".$subsCnt[0]["cnt"].")</span>";
}

//show user profile
if($_GET["action"] == "showProfile" && is_numeric($_GET["userId"]))
{
	$user = getUserProfile($_GET["userId"],$db);
	if($user["gender"] == 'Male')
		$mchecked = "checked";
	if($user["gender"] == 'Female')
		$fchecked = "checked";
	if($user["getEmailOnVideoComment"] == 1)
		$gchecked = "checked";	
	switch($user["languageId"])
	{
		case 5:
			$aselected = "selected";
			break;
		case 19:
			$eselected = "selected";
			break;
		case 67:
			$rselected = "selected";
			break;
	}
		
	$ret = "
		<div style='float:left; width:300'>
		<div class='topgap'>
		<label>$content[CODE]:</label>
		<div class='gap'>
			<input class='field' type='text' name='code' id='code' disabled value='$user[id]' style='width:300px'>
		</div>
		</div>
		<div class='topgap'>
			<label>$content[NAME]:</label>
			<div class='gap'>
				<input class='field' type='text' name='name' id='name' disabled value='$user[firstName]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[SURNAME]:</label>
			<div class='gap'>
				<input class='field' type='text' name='surname' id='surname' disabled value='$user[lastName]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[FATHERNAME]:</label>
			<div class='gap'>
				<input class='field' type='text' name='fatherName' id='fatherName' disabled value='$user[fatherName]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[BIRTHDATE]:</label>
			<div class='gap'>
				<input class='field' type='text' name='bday' id='bday' disabled value='$user[birthDate]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[GENDER]: $user[gender]</label>
			<div class='gender'>
				<input type='radio' name='gender' id='gender'  $mchecked >$content[MALE]
				<input type='radio' name='gender' id='gender'  $fchecked >$content[FEMALE]
			</div>
		</div>	
		<div class='topgap'>
			<label>$content[POSITION]:</label>
			<div class='gap'>
				<input class='field' type='text' name='position' id='position' disabled value='$user[profession]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[INTERESTS]:</label>
			<div class='gap'>
				<input class='field' type='text' name='interests' id='interests' disabled value='$user[interests]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[EMAIL]:</label>
			<div class='gap'>
				<input class='field' type='email' name='email' id='email' disabled value='$user[email]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
			<label>$content[PHONE]:</label>
			<div class='gap'>
				<input class='field' type='text' name='phone' id='phone' disabled value='$user[phoneNumber]' style='width:300px'>
			</div>
		</div>
		<div class='topgap'>
				<label>$content[LANGUAGE]:</label>
			<div class='gap'>
				<select class='field' name='lang' id='lang' disabled style='width:300px'>
					<option value='az' $aselected>$content[AZERBAIJANI]</option>
					<option value='en' $eselected>$content[ENGLISH]</option>
					<option value='ru' $rselected>$content[RUSSIAN]</option>
				</select>
			</div>
		</div>
		<br>
		<div class='topgap'>
			<label>$content[USERNAME]:</label>
			<div class='gap'>
				<input class='field' type='text' name='username' id='username' disabled value='$user[userName]' disabled style='width:300px'>
			</div>
		</div>
		
		<div class='topgap'>
			<label>$content[getEmailOnComment]:</label>
			<div class='gap'>
				<input class='emailCheck' type='checkbox' $gchecked name='getEmailOnComment' id='getEmailOnComment' disabled>
			</div>
		</div>
		</div>
		<div class='profilePic' style='float:right; width:150px;margin-left:0px; text-align:center'>
		<img src='$user[picturePath]' width=100 height=100>
		</div>	
	";
	echo $ret;
}

function getUserProfile($id,$db)
{
	$db->where("id=$id");
	$res = $db->get("users");
	return $res[0];
}
//Add/Remove video from folder
if($_GET["action"] == "addRemove" && 
	isset($_GET["videoId"]) && is_numeric($_GET["videoId"]) && 
	isset($_GET["flag"]) && is_numeric($_GET["flag"]) && 
	isset($_SESSION["userId"]) && is_numeric($_SESSION["userId"]))
{
	if($_GET["flag"] == 1)
	{
		$qry = "delete from foldervideos 
				where videoId = $_GET[videoId] and exists(select 1 from folders where folders.id=foldervideos.folderId and createdById=".$_SESSION["userId"].")";
		$db->rawQuery($qry);
		if($db->count>0) 
			echo 1;
		else
			echo "";
	}
	if($_GET["flag"] == 2)
	{
		if(!$access->authorized(57))
		{
			echo $content["INSUFFACCESS"];
			return;
		}
		if(is_numeric($_GET["videoId"]) && is_numeric($_GET["folderId"]))
		{
			$res = $db->insert("foldervideos", array("folderId"=>trim($_GET["folderId"]),
													  "videoId"=>trim($_GET["videoId"]),
													  "addedByIP"=>$_SERVER['REMOTE_ADDR'],
													  "added"=>date("Y-m-d H:i:s")));
			if($db->count > 0) 
				echo 1;
			else
				echo "";
		}
	}
}
if($_POST["action"] == "addToNewFolder" && $access->hasAccess && trim($_POST["folderName"]) != "")
{
	if(strlen(trim($_POST["folderName"])) < 3)
	{
		echo $content["SHORTFOLDERNAME"];
		return;
	}
	if(!$access->authorized(57))
	{
		echo $content["INSUFFACCESS"];
		return;
	}
	
	if(is_numeric($_POST["videoId"]))
	{
		$tagStr = isset($_POST["tags"]) ? $_POST["tags"] : "";
		$tags = array_unique(explode(",", $tagStr));
		$continue = true;
		$db->startTransaction();
		$folderId = $db->insert("folders",array("name" => trim($_POST["folderName"]),
										  "created" =>date("Y-m-d H:i:s"),
										  "createdById" => $access->userId,
										  "createdByIP" => $_SERVER['REMOTE_ADDR']));
		if($folderId)
		{
			foreach($tags as $tag)
			{
				$db->where("name='" . trim($tag) . "' and langId=".$langIds[$_SESSION["lang"]]);
				$res = $db->getOne("tags");
				if ($db->count == 1) 
					$id = $res["id"];
				else
					$id = $db->insert("tags", array("name"=>trim($tag),
											"langId"=>$langIds[$_SESSION["lang"]],
											"created"=>date("Y-m-d H:i:s"),
											"createdById"=>$access->userId));
				if($id)
				{
					$id = $db->insert("foldertags", array("tagId"=>$id,
										"folderId"=>$folderId));
				}
				
				if(!$id)
				{
					$continue = false;
					break;
				}
			}
			if($continue)
			{
				$res = $db->insert("foldervideos", array("folderId"=>trim($folderId),
													  "videoId"=>trim($_POST["videoId"]),
													  "addedByIP"=>$_SERVER['REMOTE_ADDR'],
													  "added"=>date("Y-m-d H:i:s")));
				if($db->count > 0) 
				{
					$db->commit();
					//$okMessage = $content["ADDEDTOFOLDER"];
					echo 1;
				}
			}
			else
			{
				$db->rollback();
				echo "";
			}
		}
		else
		{
			$db->rollback();
			echo "";
		}
	}
}

//Comment actions
if($_POST["action"] == "delComment" && $access->hasAccess && is_numeric($_POST["commentId"]) && is_numeric($_POST["videoId"]))
{
	$db->where("id=".$_POST["commentId"]." and createdById=".$access->userId);
	$res = $db->delete("comments");
	if($res)
		echo "1";
}
if ($_POST["action"]=="comment" && is_numeric($_POST["videoId"]))
{
	$result = "success";
	if($access->hasAccess)
		if(!$access->authorized(51))
		{
			$result = "error";
			$messages['noaccess'] = $content["INSUFFACCESS"];
			return;
		}
		//echo ""$result; return;
	if(!isset($_POST["comment"]) || trim($_POST["comment"]) == "")
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
		return;
	} 
	if(!$access->hasAccess && (!isset($_POST["email"]) || $_POST["email"] == ""))
	{
		$result = "error";
		$messages["noEmail"] = $content["NOEMAIL"];
		return;
	}
	
	if($result == "success")
	{
		//$db->startTransaction();
		$isConfirmed = 1;
		$email = "";
		$created = date("Y-m-d H:i:s");
		if(!$access->hasAccess) 
		{
			$email = $_POST["email"];
			$isConfirmed = 0;
		}
				
		$commentId = $db->insert("comments", array("comment"=>trim($_POST["comment"]),
												  "videoId"=>trim($_POST["videoId"]),
												  "createdById"=>$access->userId,
												  "userIP"=>$_SERVER['REMOTE_ADDR'],
												  "isConfirmed"=>$isConfirmed,
												  "email"=>$email,
												  "created"=>$created)); 
		if($commentId && isset($_POST["email"]) && $_POST["email"] != "")
			$okMessage = $content["COMMENTSENT2CONF"];
		
		if($commentId)
		{
			$res = $db->rawQuery("select getEmailOnVideoComment,getEmailAfterMyComment,email,firstName,lastName from users
								where id = (select addedById from videos where id=".trim($_POST["videoId"]).")");
								//print_r($res);
			if($res[0]["getEmailOnVideoComment"] == 1 && $res[0]["email"] != "")
			{
				$db->rawQuery("insert into subsmails (sendTo,subject,body,status) values
							    ('" . $res[0]["email"] . "','" . 
								$content["getEmailOnComment"] . "','" .
								base64_encode($content["getEmailOnCommentBody"]."<br><a href=$domain?page=watchVideo&id=".trim($_POST["videoId"]).">$domain</a>") . "',0)");
								;
				// $mail->addAddress($res[0]["email"], $res[0]["firstName"].' '.$res[0]["lastName"]);     // Add a recipient Name is optional	
				// $mail->Subject = $content["getEmailOnComment"];
				// $mail->Body    = $content["getEmailOnCommentBody"]."<br><a href=$domain?page=watchVideo&id=".trim($_POST["videoId"]).">$domain</a>";
				// $mail->send();
				// $mail->ClearAllRecipients( );
			}
			
			$res = $db->rawQuery("select getEmailOnVideoComment,getEmailAfterMyComment,email,firstName,lastName from users
								where id in (select createdById from comments where videoId = ".trim($_POST["videoId"]).")
								and id != ".$access->userId);
								//print_r($res);
			for($i=0; $i<count($res); $i++)
			{
				if($res[$i]["getEmailAfterMyComment"] == 1 && $res[$i]["email"] != "")
				{
					$db->rawQuery("insert into subsmails (sendTo,subject,body,status) values
							    ('" . $res[$i]["email"] . "','" . 
								$content["getEmailAfterMyComment"] . "','" .
								base64_encode($content["getEmailAfterMyCommentBody"]."<br><a href=$domain?page=watchVideo&id=".trim($_POST["videoId"]).">$domain</a>") . "',0)");
					// $mail->addAddress($res[$i]["email"], $res[$i]["firstName"].' '.$res[$i]["lastName"]);     // Add a recipient Name is optional	
					// $mail->Subject = $content["getEmailAfterMyComment"];
					// $mail->Body    = $content["getEmailAfterMyCommentBody"]."<br><a href=$domain?page=watchVideo&id=".trim($_POST["videoId"]).">$domain</a>";
					// $mail->send();
					// $mail->ClearAllRecipients( );
				}
			}
		}
		//$db->commit();
		if(trim($access->picture) == "")
			$access->picture = "./uploads/images/noimage.png";
		$str = "<li id='li$commentId'>
			<div class='commenterImage'>";
			if($access->hasAccess)  
				$str .= "<img height=30 width=50 src='".$access->picture."' />";
		    else
				$str .= "<img height=30 width=50 src='./uploads/images/noimage.png' />";
		$str .= "</div>
			<div class='commentText$commentId'>
				<span id='cmt$commentId'><p>".trim($_POST["comment"])."</p> </span>
			<span class='date sub-text'>";
		if($access->hasAccess)
			$str .="<a href='index.php?userId=" . $access->userId . "'>".
					$access->userName."</a>, $created 
					<a href='javascript:void(0);' onclick='editComment($commentId,1)'>".$content["EDIT"]."</a>
					<a onclick='commentAction(".$_POST["videoId"].",$commentId,1)' href='#'>".$content["DELETE"]."</a>";
		else
			$str .= $_POST["email"] .", $created";
		$str .=	"</span>
			</div>
			<div class='commentTextEdit$commentId' style='display:none'>
				<form name='frmComment' id='frmComment' style='float:none;' method='post' action='?page=watchVideo&id=".$_POST["videoId"]."&action=editComment&commentId=$commentId'>
					<input type='hidden' name='commentId' id='commentId' value='$commentId'>
					<TEXTAREA id='comment$commentId' name='comment$commentId' required ROWS=2 COLS=20 class='cmtBox' style='width:640px;'>".$_POST["comment"]."</TEXTAREA>
					<input class='post'  type='button' onclick='commentAction(".$_POST["videoId"].",$commentId,3)' value='".$content["SAVE"]."'>
					<input class='post'  type='button' value='".$content["CANCEL"]."' onclick='editComment($commentId,2)'>
				</form>
			</div>
		</li>";
	}
	
	echo $str;
}
//sort comments
if($_GET["action"] == "sortComm" && is_numeric($_GET["videoId"]) && is_numeric($_GET["dir"]))
{
	if($_GET["dir"] == 1)
		$sort = "asc";
	if($_GET["dir"] == 2)
		$sort = "desc";
	
	$qry = "SELECT c.id commentId, c.comment,c.createdById,DATE_FORMAT(c.created,'%d %b %Y %T') created,c.updated,
				if(c.createdById!='NULL',
					(case when (u.isDeleted = 1) then concat('".$content["USER"]."-',u.id) else u.userName end),
					concat('".$content["GUEST"]."-',c.id)) author,
				if(u.picturePath!='',u.picturePath,'./uploads/images/noimage.png') picturePath
				FROM comments c
				left join users u on u.id=c.createdById
				where c.isConfirmed=1 and c.videoId=$_GET[videoId]
				order by c.created $sort"; //echo $qry;
	$res = $db->rawQuery($qry);
	
	if($res)
	{
		for($i=0; $i<count($res); $i++)
		{
			$str .= "<li id='li" . $res[$i]["commentId"] . "'>
						<div class='commenterImage'>
						  <img height=30 width=50 src='".$res[$i]["picturePath"]."' />
						</div>
						<div class='commentText" . $res[$i]["commentId"] . "'>
							<span id='cmt" . $res[$i]["commentId"] . "'><p>" . $res[$i]["comment"] . "</p></span>
							<span class='date sub-text'>";
							if ($res[$i]["createdById"] != "")
								$str .= "<a href='index.php?userId=" . $res[$i]["createdById"] . "'>";
							$str .= $res[$i]["author"] . "</a>, " . $res[$i]["created"];
							if ($res[$i]["createdById"] == $access-userId)
								$str .= "<a href='javascript:void(0);' onclick='editComment(" . $res[$i]["commentId"] . ",1)'>" . $content["EDIT"] . "</a>
										 <a onclick='commentAction(".$_GET["videoId"]."," . $res[$i]["commentId"] . ",1)' href='#'>" . $content["DELETE"] . "</a>";
						$str .= "</span>
						</div>
						<div class='commentTextEdit" . $res[$i]["commentId"] . "' style='display:none'>
							<form name='frmComment' id='frmComment' style='float:none;' method='post' action='?page=watchVideo&id=".$_GET["videoId"]."&action=editComment&commentId=" . $res[$i]["commentId"] . "'>
								<input type='hidden' name='commentId' id='commentId' value='" . $res[$i]["commentId"] . "'>
								<TEXTAREA id='comment" . $res[$i]["commentId"] . "' name='comment" . $res[$i]["commentId"] . "' required ROWS=2 COLS=20 class='cmtBox' style='width:640px;'>" . $res[$i]["comment"] . "</TEXTAREA>
								<input class='post'  type='button' onclick='commentAction(".$_GET["videoId"]."," . $res[$i]["commentId"] . ",3)' value='" . $content["SAVE"] . "' >
								<input class='post'  type='button' value='" . $content["CANCEL"] . "' onclick='editComment(" . $res[$i]["commentId"] . ",2)'>
							</form>
						</div>
					</li>";
		}
		echo $str;
	}
}

if($_POST["action"]=="editComment")
{
	$result = "success";
	if(!$access->authorized(52))
	{
		$result = "error";
		$messages['noaccess'] = $content["INSUFFACCESS"];
		return;
	}
	if(!is_numeric($_POST["commentId"]))
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	
	if(!isset($_POST["comment"]) || trim($_POST["comment"]) == "")
	{
		$result = "error";
		$messages["noComment"] = $content["NOCOMMENT"];
	}
	
	if(!is_numeric($_POST["videoId"]))
	{
		$result = "error";
		$messages["noVideoId"] = $content["NOID"];
	}
	if($result == "success")
	{
		//$db->startTransaction();
		$db->where("id=".$_POST["commentId"]." and createdById=".$access->userId);
		$commentId = $db->update("comments", array("comment"=>trim($_POST["comment"]),
												  "updatedByIP"=>$_SERVER['REMOTE_ADDR'],
												  "updatedById"=>$access->userId,
												  "updated"=>date("Y-m-d H:i:s")));
		if($commentId)
			echo "1";
		//$db->commit();
		
	}
}

//LIKE DISLIKE actions
if($_GET["action"] == "likeIt" && 
	isset($_GET["videoId"]) && is_numeric($_GET["videoId"]) && 
	isset($_GET["flag"]) && is_numeric($_GET["flag"]) && 
	isset($_SESSION["userId"]) && is_numeric($_SESSION["userId"]))
{
	
	if($_GET["flag"] == 1)
	{
		if(!$access->authorized(53))
		{
			//$result = "error";
			//$messages['noaccess'] = $content["INSUFFACCESS"];
			echo "";
			return;
		}
		$db->rawQuery("insert into videoviews (userId,videoId,action,actionDate) 
						values (".$_SESSION["userId"].",$_GET[videoId],1,'".date("Y-m-d H:i:s")."')
						on duplicate key update
						action = 1, actionDate = '".date("Y-m-d H:i:s")."'");
	}
	if($_GET["flag"] == 2)
	{
		if(!$access->authorized(54))
		{
			//$result = "error";
			//$messages['noaccess'] = $content["INSUFFACCESS"];
			echo "";
			return;
		}
		$db->rawQuery("insert into videoviews (userId,videoId,action,actionDate) 
						values (".$_SESSION["userId"].",$_GET[videoId],-1,'".date("Y-m-d H:i:s")."')
						on duplicate key update
						action = -1, actionDate = '".date("Y-m-d H:i:s")."'");
	}
	//if($db->count>0)
	//{
		$res = $db->rawQuery("SELECT SUM(IF(action = 1, 1, 0)) likeCount,
									  SUM(IF(action = -1, 1, 0)) dislikeCount						  		
								FROM videoviews
								where videoId=".$_GET["videoId"]);
		if($res[0]["likeCount"]>=0 && $res[0]["dislikeCount"]>=0)
			echo $res[0]["likeCount"].";".$res[0]["dislikeCount"];
	//}
}

if($_GET["action"] == "getAccess" && $_GET["id"]>0)
{ 
$table = <<<TBL
<table border="1" id="t01" style="width:100%">
	<tr style="background-color:#B3AC96">
		<td>$content[ACTIONNAME]</td><td>$content[DATERANGE]</td><td>$content[HASACCESS]</td>
	</tr>
TBL;
	
$accessTypes = getAccessTypes($lang);
$ownedAccess = getOwnedAccess($_GET["id"]);
for($i=0; $i<count($accessTypes); $i++)
{
	$checked = "";
	$from = "";
	$to ="";
	for($j=0; $j<count($ownedAccess); $j++)
	{
		if($accessTypes[$i]["id"] == $ownedAccess[$j]["accessTypeId"])
		{
			$checked = "checked";
			$from = getNormalizedDate($ownedAccess[$j]["startDate"]);
			$to = getNormalizedDate($ownedAccess[$j]["endDate"]);
		}
	}
	$table .= "
	<tr>
		<td>".$accessTypes[$i]["name"]."</td>
		<td>
			<input type=hidden name=accessId[] id=accessId[] value=".$accessTypes[$i]["id"].">
			<input class=field style='width:80px' type=text name=from[] id=from".$accessTypes[$i]["id"]." value=$from>
			<input class=field style='width:80px' type=text name=to[] id=to".$accessTypes[$i]["id"]." value=$to>
		</td>
		<td><input type=checkbox name=hasAccess[] id=hasAccess[] $checked ></td>
	</tr>";
}
$table .= <<<TBL
	<tr>	
		<td colspan=3><br><input class="roleSave" class="login39" type="submit" value="$content[SAVE]" name="submit"></td>
	</tr>
</table>
TBL;
	
echo $table;
}

if($_GET["action"] == "share" && is_numeric($_GET["videoId"]) && is_numeric($_GET["flag"]) )
{	
	if($access->hasAccess)
		$userId = $access->userId;
	else
	{
		$userId = 0;
		$cond = " and IP = '".$_SERVER['REMOTE_ADDR']."'";
	}
	if($_GET["flag"] == 1)
	{
		$sn = "fbCount";
		$dt = "fbShareDate";
	}
	else
	{
		$sn = "twCount";
		$dt = "twShareDate";
	}
	
	$db->rawQuery("update videoviews set $sn=$sn+1,$dt='".date("Y-m-d H:i:s")."' where videoId=".$_GET["videoId"]." and userId=$userId $cond");
	//$db->where("videoId=".$_GET["videoId"]." and userId=$userId $cond");
	// $ok = $db->update("videoviews", array($sn=>"$sn+1",
										  // $dt=>date("Y-m-d H:i:s")
										// )); echo $db->getLastQuery(); 
	if($ok)
		echo "1";
}

function getAccessTypes($lang)
{
	global $db;
	//$db->where("id=$id");
	$res = $db->rawQuery("select id, name".$lang." name from accesstypes");
	return $res;
}

function getOwnedAccess($id)
{
	global $db;
	$db->where("roleId=".$id);
	$res = $db->get("roleaccess");
	return $res;
}

function getNormalizedDate($rawDate)
{
	global $lang;
	list($year, $month, $day) = explode('-', $rawDate);//return $month.$day.$year;
	if($year == "0000")
		return "";
	$day = substr($rawDate,8,2);
	if($lang == 'az' || $lang == 'ru')
		$date = $day.".".$month.".".$year;
	if($lang == 'en')
		$date = $month . "/" . $day . "/" . $year;
	return $date;
}
?>