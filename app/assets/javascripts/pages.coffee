# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

current = 0
translations = []

load = ->
  $.ajaxSetup
    dataType: 'json'
  $.get '/translations/random.json',
    (data) ->
      translations = data
      show_papa()

increment_current_by = (num) ->
  current = Math.abs (current + num)%translations.length

show_papa = ->
  $('.translation').find('.papa').html(translations[current].papa).fadeIn('slow')
  hide_pontifice()

hide_pontifice = ->
  $('.translation').find('.pontifice, .tweet').stop().hide()

show_pontifice = ->
  $('.translation').find('.pontifice').html(translations[current].pontifice).stop().fadeIn('slow')
  $('.translation').find('.tweet').stop().delay(1000).fadeIn('slow')

more = ->
  if $('.translation').find('.pontifice').is(':visible')
    show_papa()
    trackEvent ['Pontifice', 'Next']
    $('.load').html('Mostrar')
  else
    increment_current_by(1)
    show_pontifice()
    $('.load').html('Siguiente')
    trackEvent ['Pontifice', 'Show']

back = ->
  increment_current_by(-1)
  hide_pontifice()
  show_papa()
  $('.load').html('Mostrar')
  trackEvent ['Pontifice', 'Back']


tweet = (e) ->
  e.stopPropagation()
  url = encodeURIComponent ''
  message = encodeURIComponent translations[current].papa + ': ' + translations[current].pontifice + ' www.pontifice.cl #pontífices'
  hashtags = encodeURIComponent ''
  url = "https://twitter.com/intent/tweet?url=#{url}&text=#{message}&hashtags=#{hashtags}"
  openPopUp url

openPopUp = (url) ->
  width = 575
  height = 310
  left = ($(window).width() - width) / 2
  top = ($(window).height() - height) / 2
  opts = 'status=1' + ',width=' + width + ',height=' + height + ',top=' + top + ',left=' + left
  window.open(url, '_blank', opts)

$ ->
  load()
  $('.load').click(more)
  $('.translation').click(more)
  $('.tweet').click(tweet)
  $('body').keyup (e) ->
    if(e.keyCode == 37) # left arrow
      back()
    else if(e.keyCode == 13 || e.keyCode == 32 || e.keyCode == 39) # Enter, space or right arrow
      more()


  $('#new_translation').on 'ajax:success', (e, data, status, xhr) ->
    $(@).find('input[type=text]').val('')

