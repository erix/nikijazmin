module BlogHelper
  # enables the languages in facebook like button
  def fb_source_path
    locale = {}
    locale[:hu] = 'hu_HU'
    locale[:fi] = 'fi_FI'
    locale[:en] = 'en_US'
    "//connect.facebook.net/#{locale[I18n.locale]}/all.js#xfbml=1"
  end
end
