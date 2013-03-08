class Review < ActiveRecord::Base
  attr_accessible :product_id, :quote, :image, :link
  belongs_to :product

  #expected to upload retina images
  has_attached_file :image, :styles => { :normal => "50%", :thumb => "50x50>"}
end
