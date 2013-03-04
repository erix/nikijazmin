module GalleryHelper
  def cover(album)
    album.pictures.first
  end

  def picture(album, index)
    album.pictures.fetch(index) or album.pictures.first
  end
end
