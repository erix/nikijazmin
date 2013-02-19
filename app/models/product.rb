class Product < ActiveRecord::Base
  TYPE = {:book => 0, :app => 1}

  attr_accessible :banner, :desc, :icon, :mini_banner, :name, :store_link

  def self.type(t)
    TYPE[t]
  end

  def product_type
    TYPE.key(read_attribute(:product_type))
  end

  def product_type=(t)
    write_attribute(:product_type, Product.type(t))
  end
end
