$ ->
  slider = $(".slider ul")
  images = slider.find("img")
  ribbon_text = $(".ribbon h3")
  current = 0;
  timer_interval = 3000 # 3 seconds

  click_handler = ->
    current += 1;
    if current == images.length
      current = 0
      margin = '0'
    else
      margin = '-=784px'
    slider.animate {marginLeft: margin}, 600, ->
      ribbon_text.text $(images[current]).attr('alt')

  slider.click(click_handler)

  setInterval(click_handler, timer_interval)

