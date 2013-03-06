class Review < ActiveRecord::Base
  attr_accessible :product_id, :quote, :image, :link
  belongs_to :product
  has_attached_file :image, :styles => { :normal => "50%"  } #expected to upload retina images
end
