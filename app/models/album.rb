class Album < ActiveRecord::Base
  attr_accessible :name, :locale
  has_many :pictures, :dependent => :destroy

  default_scope order("created_at DESC")
end
