$(document).ready ->
  $(".audio-source-block-file > #audio_sample").fileupload
    dataType: "json"
    add:(e, data)->
      data.context = $(".audio-source-block-file > #submit").removeClass("disabled").click ->
        showProcessingBlock()
        data.submit()
    done:(e, data) ->
      showResultsBlock(data.result)
      $(".audio-source-block-file > #submit").unbind('click')
    fail: (e, data) ->
      showErrorBlock()
      $(".audio-source-block-file > #submit").unbind('click')
    always: (e, date)->
      $(".audio-source-block-file > #submit").addClass("disabled")

  $('.audio-source-block-file > #select').click ->
    $('.audio-source-block-file > #audio_sample').click()