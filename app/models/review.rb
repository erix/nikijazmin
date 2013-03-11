class Review < ActiveRecord::Base
  attr_accessible :product_id, :quote, :image, :link, :images_geometry
  belongs_to :product

  #expected to upload retina images
  has_attached_file :image, :styles => { :normal => "50%" }

  after_post_process :save_image_dimensions

  def image_size(style)
    if self.images_geometry
      sizes = JSON.parse self.images_geometry
      sizes[style.to_s]
    else
      ""
    end
  end

  private
  def save_image_dimensions
    sizes = Hash.new
    image.styles.keys.each do |style|
      size = Paperclip::Geometry.from_file(image.queued_for_write[style])
      sizes[style] = size.to_s
    end
    self.images_geometry = sizes.to_json
  end
end
