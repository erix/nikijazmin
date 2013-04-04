module GalleryHelper
  def cover(album)
    album.pictures.first
  end

  def picture(album, index)
    album.pictures.fetch index, album.pictures.first
  end
end
