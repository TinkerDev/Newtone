log = (message) ->
  val = $("#debug").val()
  $("#debug").val [val, message].join("\n")
  $("#debug")[0].scrollTop = 99999999

$ ->
  log "Calling Recorder.initialize()"
  Recorder.initialize
    swfSrc: "../recorder.swf?" + Math.random()
    initialized: ->
      log "Initialized!"

  $("#record").on "click", ->
    log "Calling Recorder.record()"
    Recorder.record
      start: ->
        log "Recording..."

      progress: (ms) ->
        log "Record progressed: " + ms + "ms"


  $("#stop").on "click", ->
    log "Calling Recorder.stop()"
    Recorder.stop()

  $("#play").on "click", ->
    log "Calling Recorder.play()"
    Recorder.play progress: (ms) ->
      log "Play progressed: " + ms + "ms"


  $("#upload").on "click", ->
    log "Calling Recorder.upload()"
    Recorder.upload
      method: "POST"
      url: "/recognition/recognize"
      audioParam: "track"
      success: (responseText) ->
        log "Uploaded\n"
        console.log(responseText)


  $("#getDebugLog").on "click", ->
    log " === Flash Debug Log === \n" + Recorder.flashInterface().debugLog().join("\n") + " === End Debug Log === \n"

