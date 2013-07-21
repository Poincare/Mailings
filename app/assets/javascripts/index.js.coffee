# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

clear_input = () ->
  $(this).focus().select()
 
init = () ->
  console.log("INIT");
  $("#upload").click init_filepicker
  $("input").click clear_input
  $("textarea").click clear_input

$(document).ready init
