// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function textareaPlaceholderNewlines() {
 
        $('textarea[placeholder*="\n"]').each(function(){
 
                // Store placeholder elsewhere and blank it
                $(this).attr('data-placeholder', $(this).attr('placeholder'));
                $(this).attr('placeholder', '');
 
                // On focus, if value = placeholder, blank it
                $(this).focus(function(e){      
                        if( $(this).val() == $(this).attr('data-placeholder') ) {
                                $(this).attr('value', '');
                                $(this).removeClass('placeholder');
                        }               
                });                     
 
                // On blur, if value = blank, insert placeholder
                $(this).blur(function(e){
                        if( $(this).val() == '' ) {
                                $(this).attr('value', $(this).attr('data-placeholder'));
                                $(this).addClass('placeholder');
                        }
                });             
 
                // Call blur method to preset element - this will insert the placeholder
                // if the value hasn't been prepopulated
                $(this).blur();
        });
 
}
