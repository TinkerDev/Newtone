$(document).ready ->
  $(".audio-source-block-file > #audio_sample").fileupload
    dataType: "json"
    add:(e, data)->
      data.context = $(".audio-source-block-file > #submit").removeClass("disabled").click ->
        showProcessingBlock()
        jqXHR = data.submit()
        .success (result, textStatus, jqXHR) ->
            showResultsBlock(result)
            $(".audio-source-block-file > #submit").unbind('click')
        .error (jqXHR, textStatus, errorThrown) ->
            showErrorBlock()
            $(".audio-source-block-file > #submit").unbind('click')
    always: (e, date)->
      $(".audio-source-block-file > #select").addClass("disabled")

  $('.audio-source-block-file > #select').click ->
    $('.audio-source-block-file > #audio_sample').click()