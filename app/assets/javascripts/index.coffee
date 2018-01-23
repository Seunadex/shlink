# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#url-form').submit (event) ->
    event.preventDefault()
    original_url = $('#icon-prefix').val()
    
    $.ajax
      url: "/links"
      type: "POST"
      data: { url: original_url }
      success: () ->
        console.log 'done'
    return