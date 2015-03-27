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
  $('.translation').find('.pontifice, .tweet').stop().hide()

show_pontifice = ->
  $('.translation').find('.pontifice').html(translations[current].pontifice).stop().fadeIn('slow')
  $('.translation').find('.tweet').stop().delay(1000).fadeIn('slow')

more = ->
  if $('.translation').find('.pontifice').is(':visible')
    show_next()
    trackEvent ['Pontifice', 'Next']
    $('.load').html('Mostrar')
  else
    show_pontifice()
    $('.load').html('Siguiente')
    trackEvent ['Pontifice', 'Show']

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


  $('#new_translation').on 'ajax:success', (e, data, status, xhr) ->
    $(@).find('input[type=text]').val('')

