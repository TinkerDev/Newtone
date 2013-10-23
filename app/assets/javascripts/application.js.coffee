#= require jquery
#= require jquery_ujs
#= require jquery-fileupload/basic
#= require file_upload
#= require recorder
#= require recording
#= require recognition
#= require underscore
#= require backbone
#= require backbone/newtone

$ ->
  window.router = new Newtone.Routers.Recognition
  Backbone.history.start()