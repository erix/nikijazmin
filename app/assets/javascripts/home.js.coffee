$.fn.slider = ->
  $ul = $(@find("ul"))
  images = $ul.find("img")
  $ribbon_text = $(@find(".ribbon h3"))
  current = 0;
  timer_interval = 3000 # 3 seconds
  image_width = 0;

  click_handler = ->
    current += 1;
    if current == images.length
      current = 0
      margin = '0'
    else
      margin = "-=#{image_width}"
    $ul.animate {marginLeft: margin}, 600, ->
      $ribbon_text.text $(images[current]).attr('alt')

  $ul.click(click_handler)

  promises = []
  for image in images
    d = $.Deferred()
    promises.push d
    $(image).on 'load', d.resolve

  # when all images loaded start the timer and set the correct width
  $.when.apply($, promises).done =>
    setInterval(click_handler, timer_interval)
    image_width = $(images[0]).width() if images[0]
    $ul.width images.length * image_width

$ ->
  $(".slider").slider()
