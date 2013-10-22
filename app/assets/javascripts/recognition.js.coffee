@showProcessingBlock = () ->
  $('.audio-source-block').hide()
  $('.processing-block').show()

@showResultsBlock = (data) ->
  $('.processing-block').hide()
  $('.results-block').show()

  if data.length > 0
    $('.results-block > .bad').hide()
    $('.results-block > .good').show()
    new_html = data.map (el) -> ('<div class="result">'+el.artist+' - '+el.name+'</div>' )
    $('.results-block > .good > .row > .col-md-9 > .text').html(new_html)
  else
    $('.results-block > .bad').show()
    $('.results-block > .good').hide()

@showErrorBlock = () ->
  $('.processing-block').hide()
  $('.error-block').show()

@showAudioSourceBlock = () ->
  $('.processing-block').hide()
  $('.results-block').hide()
  $('.error-block').hide()
  $('.audio-source-block').show()

$('#cancel_processing').click ->
  jqXHR.abort()
  showAudioSourceBlock()