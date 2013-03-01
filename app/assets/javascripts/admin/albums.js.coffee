$ ->
    $('#fileupload').fileupload()
    # Load existing files:
    $('#fileupload').each ->
      $.getJSON this.action, (result) =>
          if result
            $(this).fileupload('option', 'done').call(this, null, {result:result})
