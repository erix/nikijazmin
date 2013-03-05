$.fn.slider = ->
  $ul = $(@find("ul"))
  images = $ul.find("img")
  $ribbon_text = $(@find(".ribbon h3"))
  $store_link = $(@find(".store_badge a"))
  current = 0;
  timer_interval = 3000 # next slide
  image_width = 0;

  #add event listeners for transition end
  $ul.on "transitionend webkitTransitionEnd msTransitionEnd oTransitionEnd", ->
    # change the ribbon text and the store link
    $ribbon_text.text $(images[current]).attr('alt')
    href = $(images[current]).data('href')
    if href
      $store_link.parent().show()
      $store_link.attr("href", $(images[current]).data("href"))
    else
      $store_link.parent().hide()

  timer_handler = ->
    current += 1;
    if current == images.length
      current = 0
      margin = '0'
    else
      margin = "-=#{image_width}"
    $ul.css "margin-left", margin

  # $ul.click(click_handler)

  promises = []
  for image in images
    d = $.Deferred()
    promises.push d
    $(image).on 'load', d.resolve

  # when all images loaded start the timer and set the correct width
  $.when.apply($, promises).done =>
    setInterval(timer_handler, timer_interval)
    image_width = $(images[0]).width() if images[0]
    $ul.width images.length * image_width

$ ->
  $(".slider").slider()
