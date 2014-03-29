$(document).ready ->
  $('#notes h4').on 'click', (e) ->
    e.preventDefault()
    target = $ e.target
    target.next('form').slideToggle('fast')

  $('#notes')
    .bind 'ajax:beforeSend', ->
      $(this).find('.status').attr('class', 'status saving').html 'Saving'
      $(this).find('input[type=submit]').attr('disabled', true)

    .bind 'ajax:complete', (event, data) ->
      notes       = $ this
      status      = notes.find '.status'
      submit      = notes.find 'input[type=submit]'
      response    = data.responseJSON
      statusClass = if response.success then 'saved' else 'error'

      status.attr('class', "status #{statusClass}").html response.message
      submit.attr('disabled', false)

  $('.scrubber')
    .bind 'ajax:beforeSend', ->
      $(this).find('.status').html 'Saving'
      $(this).find('input[type=submit]').attr('disabled', true)

    .bind 'ajax:complete', (event, data) ->
      $(this).find('.status').html data.responseJSON.message
      $(this).find('input[type=submit]').attr('disabled', false)

