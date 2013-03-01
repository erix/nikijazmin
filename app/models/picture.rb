class Picture < ActiveRecord::Base
  attr_accessible :desc, :name, :image
  belongs_to :album
  has_attached_file :image
end
