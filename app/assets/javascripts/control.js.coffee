$ ->
  $("#expirable input[type='checkbox']").on "change", ->
    checked = $(this).is ':checked'
    $("#expires select").each ->
      $(this).prop 'disabled', !checked

  $("#expirable input[type='checkbox']").change()

