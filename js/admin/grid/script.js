/**
 * Created by Labrin on 4/8/14.
 */
$(function(){
    // select option w/ bootstrap dropdown menu
    if($('.dropdown-select').length){
        $('.dropdown-select').each(function(i){
            var ul = $(this), select = $('#'+ul.data('dropdown-target')),
                button = ul.parent().find('.dropdown-toggle');
            changeButton($("option:selected",select).text());
            $('#search-select-list a').on('click',function(e){
                e.preventDefault();
                var lnk = $(this), value = lnk.attr('href').replace('#','');
                select.val(value);
                changeButton($("option:selected",select).text())
            })
            function changeButton(text){
                button.html(text+' <span class="caret"></span>')
            }
        });
    }

    // custom checkbox
    if($('.ui-port-checkable').length){
        $('input.ui-port-checkable').each(function(){
            if($(this).hasClass('lg')) $(this).prettyCheckable({color: 'lg'});
            else if($(this).hasClass('orange')) $(this).prettyCheckable({color: 'orange'});
            else $(this).prettyCheckable({color: 'md'});
        })
    }

    // open target box
    if($('.ui-open-target').length){

        $(document).on('click','.ui-open-target',function(e){
            var obj = $(this), target = $('#'+obj.data('target'));
            console.log('e:',e)
            if(obj.hasClass('active')){
                obj.removeClass('active')
                target.addClass('hide');
            }
            else {
                obj.addClass('active')
                target.removeClass('hide');
            }

            $(document).mouseup(function (e)
            {
                var container = target;

                if (!container.is(e.target) && container.has(e.target).length === 0)
                {
                    obj.removeClass('active')
                    container.addClass('hide');
                }
            });
        });


    }

    // index hower menu
    if($('.index-welcome').length){
        $('.hasmenu').hover(function(){
            $(this).addClass('hover');
            $(this).find('.menu-submenu-list').removeClass('hide');
        },function(){
            $(this).removeClass('hover');
            $(this).find('.menu-submenu-list').addClass('hide');
        })
    }

    // Calls the selectBoxIt method
    if($("select.ui-port-select").length){
        $("select.ui-port-select").selectBoxIt({showFirstOption: false});
    }

    // Calls the selectBoxIt method
    if($("select.ui-port-select-blcok").length){
        $("select.ui-port-select-blcok").selectBoxIt({showFirstOption: false,autoWidth: false});
    }

    // Amount function
    if($('.amount-input').length){
        $('.amount-input').each(function(index, value){
            var elm = $(this),
                cls = elm.data('customclass'),
                wrapper = "<div class='amount-wrp'></div>",
                controls = $('<div class="time-ctrl"><a href="#" id="add" class="add">+</a><a href="#" id="min" class="subs">-</a></div>');

            elm.wrap(wrapper);
            elm.after(controls);
            if(cls) elm.parent().addClass(cls)
        })
        $(document).on('click','.time-ctrl a',function(e){
            e.preventDefault();
            var detectAction = $(e.target).attr('class'),
                targetInp = $(e.target).parents('.amount-wrp').find('.amount-input'),
                amount = parseInt(targetInp.val()) || 0;
            switch (detectAction){
                case 'add':
                    amount++;
                    targetInp.val(amount)
                    break
                case 'subs':
                    amount--;
                    amount = amount <= 0 ? 0: amount;
                    targetInp.val(amount);
                    break
            }
        });
    }

    // gallery zoom
    if($('#bigPic').length){

        $("#bigPic").elevateZoom({
            gallery : "productGallery",
            galleryActiveClass: "active",
            zoomWindowOffetx:90,
            zoomWindowOffety:-23,
            lensOpacity:1,
            lensBorderSize:3,
            lensColour:'rgba(251,165,77,0.4)',
            lensBorderColour:'#fba54d',
            borderSize:1,
            borderColour:'#ececec',
            easing : true
        });

        $(document).on('mouseenter', '.zoomContainer', function(){
            $('.big-picture').find('.hover-text').hide();
        })
        $(document).on('mouseleave', '.zoomContainer', function(){
            $('.big-picture').find('.hover-text').fadeIn();
        })

    }

    // table sorting
    if($('.table-sort').length){
        $('.table-sort').dataTable( {
            "paging":   false,
            "info":     false,
            "searching":   false,
            "aoColumnDefs" : [ {
                "bSortable" : false,
                "aTargets" : [ "no-sort" ]
            } ]
        });
    }

    // simple vertical tab
    if($('.ui-navtab-vertical').length){
        $('.ui-navtab-vertical li').on('click',function(){
            $('.ui-navtab-vertical li').removeClass('nb-b');
            $(this).prev().addClass('nb-b');
            if($(this).index() == 0){
                $('.setting-tab-content').addClass('no-rad');
            } else {
                if($('.setting-tab-content').hasClass('no-rad')) $('.setting-tab-content').removeClass('no-rad')
            }
        });
    }

    // custom upload
    if($('.ui-custom-upload').length){
        var SITE = SITE || {};
        SITE.fileInputs = function () {
            var $this = $(this),
                $val = $this.val(),
                valArray = $val.split('\\'),
                newVal = valArray[valArray.length - 1],
                $button = $this.siblings('.button'),
                $fakeFile = $this.parent().siblings('.file-holder');
            if (newVal !== '') {
                $this.hide();

                $button.addClass('del-image-btn');
                $button.text('Sil');
                if ($fakeFile.length === 0) {
                    $button.after('<span class="file-holder">' + newVal + '</span>');
                } else {
                    $fakeFile.text(newVal);
                }
            }

            console.log($(this))

           /* $this.unbind('change focus click', SITE.fileInputs);
            $this.hide()*/
            /*$button.parent().on('click',function(e){
                console.log('clicked')
                *//*$button.removeClass('del-image-btn');
                 $button.text('Əlavə et');*//*
            });*/
            $this.unbind('change focus click', SITE.fileInputs);
            $button.bind('click',SITE.deleteInputs)




        };
        SITE.deleteInputs = function() {
            console.log('delete');
        };

        $('.file-wrapper input[type=file]').each(function(){
            $(this).bind('change focus click', SITE.fileInputs)
        });
    }

    // combo selectbox
    if($('.ui-widget-combo').length){
        $( ".ui-widget-combo" ).combobox();
    }

    // clear input
    if($('.clear-input').length){
        $('.clear-input').on('click',function(e){
            e.preventDefault();
            var elm = $(this),
                target = $(elm.data('target'))
                inp = target.siblings('.custom-combobox').find('input');
            inp.val('').focus();
        });
    }

    // add new Property
    if($('#addNewProperty').length){
        var propCounter = 0;
        $('#addNewProperty').on('click',function(e){
            e.preventDefault();
            var sample = $('#newPropSample'),
                html = sample.clone().removeClass('hide'),
                parent = sample.parent();
            parent.removeClass('hide');
            if(propCounter>0) html.addClass('nb-t');
            parent.append(html.attr('id',''));
            propCounter++;
        });
        $(document).on('click','.remove-prop',function(e){
            e.preventDefault();
            var btn = $(this),
                parent = btn.parents('.bordered-row');
            parent.remove();
        });
    }

    // add new propperty checkbox
    if($('#addNewPropCheckbox').length){
        var counter = 0;
        $('#addNewPropCheckbox').on('click',function(e){
            e.preventDefault();
            var link = $(this),
                sample = $('#newPropCheckboxSample'),
                html = sample.clone().removeClass('hide'),
                parent = sample.parents('#checkboxzone');
            if (counter>0) html.addClass('nb-t');
            parent.append(html);
            counter++;
        });
        $(document).on('click','.remove-prop-chekbox',function(e){
            e.preventDefault();
            var btn = $(this),
                parent = btn.parents('.bordered-row');
            parent.remove();
        });
    }

    // radio button
    if($('.radio-button').length){
        $('.radio-button input').each(function(){
            var elm = $(this),
                parent = elm.parents('.radio-button'),
                target = $(elm.data('target')) || 0,
                targetparent = target.parents('.gray-box');

            console.log(target.parents('.gray-box'));

            // check default state
            if (elm.is(':checked')) {
                targetparent.removeClass('hide').find('.radio-tab-content').addClass('hide');
                target.removeClass('hide');
                parent.addClass('active');
            }



            // change on click
            elm.on('change', function(){
                $('.radio-button').removeClass('active');
                if(elm.is(':checked')) {
                    targetparent.removeClass('hide').find('.radio-tab-content').addClass('hide');
                    target.removeClass('hide');
                    parent.addClass('active');
                }
            })
        });


    }

    // disable link href
    if($('.line-disablehref').length){
        $('.line-disablehref').on('click',function(e){
            e.preventDefault();
        });
    }

    // clear input
    if($('.clear-input').length){
        $('.clear-input').on('click',function(e){
            e.preventDefault();
            var elm = $(this),
                target = $(elm.data('target'));
            target.val('').focus();
            elm.addClass('hide');
        });
        $('#storeSearchInput').keyup(function(){
            var input = $(this),
                delbtn = input.next('a');
            if(input.val().length>0){
                delbtn.removeClass('hide')
            }
            else {
                delbtn.addClass('hide')
            }
        });
    }

    // select all
    if($('.select-all-checkbox').length){
        $('.select-all-checkbox').on('change',function(e) {
            var mainselector = $(this),
                chkboxName = mainselector.attr('name');
            if(this.checked) { // check select status
                $(':checkbox[name="' + chkboxName + '"]').not(mainselector).each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                    $(this).next().addClass('checked');
                });
            }else{
                $(':checkbox[name="' + chkboxName + '"]').not(mainselector).each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"
                    $(this).next().removeClass('checked');
                });
            }
        });
    }

    // form validation
    if($('#registration').length){
        $('#registration').validate({
            errorClass: "text-danger",
            errorElement: "em",
            highlight: function(element, errorClass) {
                $(element).parents('.form-group').addClass('has-error')
                $(element).parent().append('<span class="glyphicon glyphicon-remove form-control-feedback"></span>')
            },
            unhighlight: function(element, errorClass, validClass) {
                $(element).parents('.form-group').removeClass('has-error').addClass('has-success');
                $(element).parent().find('span.glyphicon').removeClass('glyphicon-remove').addClass('glyphicon-ok');
            },
            rules: {
                name: "required",
                surname: "required",
                password: {
                    required: true,
                    minlength: 5
                },
                confirm_password: {
                    required: true,
                    minlength: 5,
                    equalTo: "#reg-password"
                },
                mail: {
                    required: true,
                    email: true
                }
            }
        });
    }

});

/********************************
    jQuery plugins
********************************/
(function($) {
    $.widget( "custom.combobox", {
        _create: function() {
            this.wrapper = $( "<span>" )
                .addClass( "custom-combobox" )
                .insertAfter( this.element );

            this.element.hide();
            this._createAutocomplete();
            this._createShowAllButton();
        },

        _createAutocomplete: function() {
            var selected = this.element.children( ":selected" ),
                value = selected.val() ? selected.text() : "";

            this.input = $( "<input>" )
                .appendTo( this.wrapper )
                .val( value )
                .attr( "title", "" )
                .addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left form-control" )
                .autocomplete({
                    delay: 0,
                    minLength: 0,
                    source: $.proxy( this, "_source" )
                })
                .tooltip({
                    tooltipClass: "ui-state-highlight"
                });

            this._on( this.input, {
                autocompleteselect: function( event, ui ) {
                    ui.item.option.selected = true;
                    this._trigger( "select", event, {
                        item: ui.item.option
                    });
                },

                autocompletechange: "_removeIfInvalid"
            });
        },

        _createShowAllButton: function() {
            var input = this.input,
                wasOpen = false;

            $( '<a><span class="caret"></span></a>')
                .attr( "tabIndex", -1 )
                //.attr( "title", "Show All Items" )
                .tooltip()
                .appendTo( this.wrapper )
                .button({
                    icons: {
                        primary: "ui-icon-triangle-1-s"
                    },
                    text: false
                })
                .removeClass( "ui-corner-all" )
                .addClass( "custom-combobox-toggle ui-corner-right btn btn-default" )
                .mousedown(function() {
                    wasOpen = input.autocomplete( "widget" ).is( ":visible" );
                })
                .click(function() {
                    input.focus();

                    // Close if already visible
                    if ( wasOpen ) {
                        return;
                    }

                    // Pass empty string as value to search for, displaying all results
                    input.autocomplete( "search", "" );
                });
        },

        _source: function( request, response ) {
            var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
            response( this.element.children( "option" ).map(function() {
                var text = $( this ).text();
                if ( this.value && ( !request.term || matcher.test(text) ) )
                    return {
                        label: text,
                        value: text,
                        option: this
                    };
            }) );
        },

        _removeIfInvalid: function( event, ui ) {

            // Selected an item, nothing to do
            if ( ui.item ) {
                return;
            }

            // Search for a match (case-insensitive)
            var value = this.input.val(),
                valueLowerCase = value.toLowerCase(),
                valid = false;
            this.element.children( "option" ).each(function() {
                if ( $( this ).text().toLowerCase() === valueLowerCase ) {
                    this.selected = valid = true;
                    return false;
                }
            });

            // Found a match, nothing to do
            if ( valid ) {
                return;
            }

            // Remove invalid value
            this.input
                .val( "" )
                .attr( "title", value + " didn't match any item" )
                .tooltip( "open" );
            this.element.val( "" );
            this._delay(function() {
                this.input.tooltip( "close" ).attr( "title", "" );
            }, 2500 );
            this.input.data( "ui-autocomplete" ).term = "";
        },

        _destroy: function() {
            this.wrapper.remove();
            this.element.show();
        }
    });
    if($.fn.validate) $.extend($.validator.messages, {
        required: "Bu xananın doldurulması vacibdir!",
        email: "Xahiş edirik düzgün mail ünvanı yazasınız!",
        minlength: "Ən azı {0} simvol yazmalısınız!",
        equalTo: "Xahiş edirik enter the same value again."
    });
})(jQuery);
