$(document).ready ->
  console.log "Calling Recorder.initialize()"
  Recorder.initialize
    swfSrc: "../recorder.swf?" + Math.random(),
    flashContainer: document.getElementById("audio-source-block-record")

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
    Recorder.submit
      method: "POST"
      url: "/recognition/recognize"
      audioParam: "track"
      success: (responseText) ->
        console.log "submited\n"
        console.log(responseText)