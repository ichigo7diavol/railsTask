// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require_tree .

$(document).ready(function() {
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue'
  });

  $('input').on('ifChecked', function(){
    event.preventDefault();
    $(this).parent().parent().submit();
  });

  $('input').on('ifUnchecked', function(){
    event.preventDefault();
    $(this).parent().parent().parent().submit();
  });

  $(document).on("click", "#sub_btn", function(){
    event.preventDefault();
    $("#sub_form").submit();
  });

  $(document).on("click", "#dec_btn", function(){
    $('#form_block').hide();
  });

  $(document).on("click", "#add_form_btn", function(){
    $('#form_block').show();
  });
});
