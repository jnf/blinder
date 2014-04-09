bind_scrubbers = (element) ->
  $(element)
    .off()
    .on 'ajax:beforeSend', ->
      $(this).find('.status').html 'Saving'
      $(this).find('input[type=submit]').attr('disabled', true)

    .on 'ajax:complete', (event, data) ->
      response = $(this).parent '.response'
      response.replaceWith data.responseText
      $('.scrubber').each -> bind_scrubbers(this) #sloppy, I know



$(document).ready ->
  $('.scrubber').each -> bind_scrubbers(this)

  $('#notes h4').on 'click', (e) ->
    e.preventDefault()
    $(e.target).next('form').slideToggle('fast')

  $('#notes')
    .on 'ajax:beforeSend', ->
      $(this).find('.status').attr('class', 'status saving').html 'Saving'
      $(this).find('input[type=submit]').attr('disabled', true)

    .on 'ajax:complete', (event, data) ->
      notes       = $ this
      status      = notes.find '.status'
      submit      = notes.find 'input[type=submit]'
      response    = data.responseJSON
      statusClass = if response.success then 'saved' else 'error'

      status.attr('class', "status #{statusClass}").html response.message
      submit.attr('disabled', false)
