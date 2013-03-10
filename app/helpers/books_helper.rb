module BooksHelper
  def icon_tag(book)
    options = {
      :"2x" => book.icon.url,
      :class => "product-icon hisrc"
    }
    options.merge!(:size => book.icon_size(:large)) unless book.icon_size(:large).blank?
    responsive_image_tag book.icon.url(:large), options
  end
end
