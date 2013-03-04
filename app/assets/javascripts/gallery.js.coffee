jQuery ->
  win = $(window)
  cContent = $('#cboxLoadedContent')
  $('.colorbox-item').on 'click', (e) ->
    e.preventDefault()
    $.colorbox
      preloading: true
      modal: true
      # transition: 'none'
      # speed: 0
      onComplete: (e) ->
        $("#rs-slider").royalSlider()
          imageScaleMode: 'fill'
          keyboardNavEnabled: true
        # ).data('royalSlider')
        # updateLightboxSize()
      href: $(this).attr('href')
    return false

  # win.resize ->
  #    updateLightboxSize()

  # updateLightboxSize() {
  #   # define size of lightbox
  #   w = win.width()
  #   if w > 1200
  #     w = '700px'
  #   else if w < 800
  #     w = '90%'
  #   else
  #     w = '60%'

  #   $.colorbox.resize
  #     width: w

  #   currRs.updateSliderSize() if currRs
  #   # fix scrolbar space
  #   setTimeout( ->
  #     $.colorbox.resize
  #     width: w
  #   ,1)
