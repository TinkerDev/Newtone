@showProcessingBlock = () ->
  $('.audio-source-block').hide()
  $('.processing-block').show()

@showResultsBlock = (data) ->
  $('.processing-block').hide()
  $('.results-block').show()

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