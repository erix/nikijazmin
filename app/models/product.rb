class Product < ActiveRecord::Base
  attr_accessible :banner, :desc, :icon, :mini_banner, :name, :store_link
end
