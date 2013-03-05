class Album < ActiveRecord::Base
  attr_accessible :name, :locale
  has_many :pictures, :dependent => :destroy
end
