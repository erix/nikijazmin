jQuery ->
  win = $(window)
  cContent = $('#cboxLoadedContent')
  currRs = {}
  $('.colorbox-item').on 'click', (e) ->
    e.preventDefault()
    $.colorbox
      preloading: true
      modal: true
      transition: 'none'
      speed: 0
      initialWidth: 1024
      initialHeight: 768
      onComplete: (e) ->
        currRs = $("#rs-slider").royalSlider(
          imageScaleMode: 'fit'
          keyboardNavEnabled: true
          arrowsNavHideOnTouch: true
        ).data('royalSlider')
        updateLightboxSize()
      href: $(this).attr('href')
    return false

  win.resize ->
     updateLightboxSize()

  updateLightboxSize = ->
    # define size of lightbox
    w = win.width()
    if w > 1200
      w = '1024px'
      h = '768px'
    else if w < 800
      w = '90%'
      h = '90%'
    else
      w = '80%'
      h = '80%'

    $.colorbox.resize
      width: w #'100%'
      height: h #'100%'

    currRs.updateSliderSize() if currRs
    # fix scrolbar space
    setTimeout( ->
      $.colorbox.resize
      width: w
    ,1)
