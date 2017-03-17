# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("table.sources > tbody > tr").on "click", ->
    source = $(this).data("source")
    document.location = "/" + source + "/show/"
    return false;

  $("table.messages > tbody > tr").on "click", ->
    message = $(this).data("message")
    source  = $(this).data("source")
    type    = $(this).data("type")
    document.location = "/" + source + "/message/" + message + "/parameters/" + type + "/"
    return false;

$(document).ready(ready)
$(document).on "page:load", ready
$(document).on "turbolinks:load", ready
