module AppsHelper
  def product_icon_tag(product, style, retina_style = :original, options = nil)
    options ||= {}
    if options[:class]
      options[:class] = "#{options[:class]} hisrc"
    else
      options[:class] = "hisrc"
    end
    options.merge! :"2x" => product.icon.url(retina_style)
    options.merge!(:size => product.icon_size(style)) unless product.icon_size(style).blank?
    responsive_image_tag product.icon.url(style), options
  end
end
