@showProcessingBlock = () ->
  $('.audio-source-block').addClass('hide')
  $('.processing-block').show()

@showResultsBlock = (data) ->
  $('.processing-block').hide()
  $('.results-block').show()
  if data.count > 0
    $('.results-block > .bad').hide()
    $('.results-block > .good').show()
    new_html = data.map (el) -> ('<span class="artist">'+el.artist+'</span><span class="name">'+el.name+'</span>' )
    alert(new_html)
    $('.results-block > .results')
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