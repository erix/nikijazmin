# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  #  download the retina images
  $('img.hisrc').hisrc(forcedBandwidth: "high")

  # make youtube links appear in lightbox
  $youtube = $('a[href*="youtu.be"]')
  $youtube.each (i, item)->
    $item = $(item)
    href = $item.attr('href')
    href = href.replace(/(?:http:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?(.+)/g, 'http://www.youtube.com/embed/$1')

    $item.colorbox
      transition: "none"
      speed: 0
      href: href
      iframe: true
      innerWidth: 420
      innerHeight: 344
