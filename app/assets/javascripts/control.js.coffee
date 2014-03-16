# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $("#expirable input[type='checkbox']").on "change", ->
    if $(this).is(":checked") == false
      $("#expires select").each ->
        $(this).prop('disabled', true);
    else
      $("#expires select").each ->
        $(this).prop('disabled', false);
  $("#expirable input[type='checkbox']").change()

