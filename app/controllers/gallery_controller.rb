class GalleryController < ApplicationController
  def index
    @albums = Album.where(:locale => I18n.locale)
  end
end
