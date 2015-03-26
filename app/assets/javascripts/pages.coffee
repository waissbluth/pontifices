# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

current = -1
translations = []

load = ->
  $.ajaxSetup
    dataType: 'json'
  $.get '/translations/random.json',
    (data) ->
      translations = data
      show_next()


show_next = ->
  current = (current + 1)%translations.length
  $('.translation').find('.papa').html(translations[current].papa).fadeIn('slow')
  $('.translation').find('.pontifice').stop().hide()

show_pontifice = ->
  $('.translation').find('.pontifice').html(translations[current].pontifice).stop().fadeIn()

more = ->
  if $('.translation').find('.pontifice').is(':visible')
    show_next()
    $('.load').html('Mostrar')
  else
    show_pontifice()
    $('.load').html('Siguiente')

$ ->
  load()
  $('.load').click(more)
  $('.translation').click(more)


  $('#new_translation').on 'ajax:success', (e, data, status, xhr) ->
    $(@).find('input[type=text]').val('')

