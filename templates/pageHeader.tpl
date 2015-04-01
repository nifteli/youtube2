<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Your Site Name</title>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="fonts/stylesheet.css"/>
	<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />
	<script src="js/tabcontent.js" type="text/javascript"></script>
	
	<!--tag scripts-->
	<link rel="stylesheet" href="css/jqcloud.min.css">
	<script src="js/jquery-1.11.2.min.js"></script>
	<script src="js/jqcloud.min.js"></script>
	<script type="text/javascript">
      /*!
       * Create an array of word objects, each representing a word in the cloud
       */
      var word_array = [
          {text: "Lorem", weight: 15},
		  {text: "Lorem2", weight: 14},
		  {text: "Lorem3", weight: 13},
		  {text: "Lorem4", weight: 14},
		  {text: "Lorem5", weight: 12},
		  {text: "Lorem6", weight: 10},
          {text: "Ipsum", weight: 19, link: "http://jquery.com/"},
          {text: "Dolor", weight: 16, html: {title: "I can haz any html attribute"}},
		  {text: "aaaa", weight: 100, html: {title: "I can haz any html attribute"}},
		  {text: "bbbb", weight: 70, html: {title: "I can haz any html attribute"}},
		  {text: "cccc", weight: 90, html: {title: "I can haz any html attribute"}},
		  {text: "dddd", weight: 60, html: {title: "I can haz any html attribute"}},
          {text: "Dolor", weight: 300, html: {title: "I can haz any html attribute"}},
		  {text: "aaaa1", weight: 409, html: {title: "I can haz any html attribute"}},
		  {text: "bbbb1", weight: 508, html: {title: "I can haz any html attribute"}},
		  {text: "cccc1", weight: 110, html: {title: "I can haz any html attribute"}},
		  {text: "dddd1", weight: 602, html: {title: "I can haz any html attribute"}},
		  {text: "Sit", weight: 7},
          {text: "Amet", weight: 5}
          // ...as many words as you want
      ];

      $(function() {
        // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
        $("#tags1").jQCloud(word_array);
      });
    </script>
</head>
