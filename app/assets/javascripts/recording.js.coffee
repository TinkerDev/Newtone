$(document).ready ->
  console.log "Calling Recorder.initialize()"
  Recorder.initialize
    swfSrc: "../recorder.swf?" + Math.random(),
    flashContainer: $("#flash-container")[0],
    onFlashSecurity: ->
      $('#flash-container').show()
      flashContainer = $(Recorder.options.flashContainer)
      offset = $('.audio-source-block-record > #record').offset()
      flashContainer.offset({ top: offset.top-20, left: offset.left-2})

    initialized: ->
      console.log "Initialized!"

  $(".audio-source-block-record > #record").on "click", ->
    console.log "Calling Recorder.record()"
    Recorder.record
      start: ->
        console.log "Recording..."
        $(".audio-source-block-record > #record").addClass('hidden')
        $(".audio-source-block-record > #stop").removeClass('hidden')
      progress: (ms) ->
        console.log "Record progressed: " + ms + "ms"


  $(".audio-source-block-record > #stop").on "click", ->
    console.log "Calling Recorder.stop()"
    Recorder.stop()
    $(".audio-source-block-record > #record").removeClass('hidden')
    $(".audio-source-block-record > #stop").addClass('hidden')
    $(".audio-source-block-record > #submit").removeClass('disabled')

  $(".audio-source-block-record > #play").on "click", ->
    console.log "Calling Recorder.play()"
    Recorder.play progress: (ms) ->
      console.log "Play progressed: " + ms + "ms"


  $(".audio-source-block-record > #submit").on "click", ->
    console.log "Calling Recorder.submit()"
    showProcessingBlock()
    Recorder.upload
      method: "POST"
      url: "/recognition/recognize"
      audioParam: "track"
      success: (data) ->
        showResultsBlock(data)
        console.log "submited\n"
        console.log(data)
      error: ->
        showErrorBlock()