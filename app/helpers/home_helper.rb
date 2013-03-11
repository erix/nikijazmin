module HomeHelper
  def review_image_tag(review, style, retina_style = :original, options = nil)
    options ||= {}
    if options[:class]
      options[:class] = "#{options[:class]} hisrc"
    else
      options[:class] = "hisrc"
    end
    options.merge! :"2x" => review.image.url(retina_style)
    options.merge!(:size => review.image_size(style)) unless review.image_size(style).blank?
    responsive_image_tag review.image.url(style), options
  end
end
