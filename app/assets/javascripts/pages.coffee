# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

load = ->
  $.get '/translations/random.json',
    (data) ->
      $('.translation').find('.papa').text(data.papa)
      $('.translation').find('.pontifice').hide().text(data.pontifice)

show_pontifice= ->
  $('.translation').find('.pontifice').fadeIn()

more = ->
  if $('.translation').find('.pontifice').is(':visible')
    load()
  else
    show_pontifice()

$ ->
  $.ajaxSetup
    dataType: 'json'

  load()
  $('.load').click(more)
  $('.translation').click(more)


  $('#new_translation').on 'ajax:success', (e, data, status, xhr) ->
    $(@).find('input[type=text]').val('')

