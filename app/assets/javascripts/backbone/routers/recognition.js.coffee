class Newtone.Routers.Recognition extends Backbone.Router
  routes:
    "": "welcome",
    "recognition/record": "record",
    "recognition/file": "file"

  welcome: ->
    alert('1')