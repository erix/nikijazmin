class Product < ActiveRecord::Base
  TYPE = {:book => 0, :app => 1}

  attr_accessible :banner, :desc, :icon, :mini_banner, :name, :store_link, :in_slider, :product_type

  def self.type(t)
    TYPE[t]
  end

  def product_type
    TYPE.key(read_attribute(:product_type))
  end

  def product_type=(t)
    if t.class == String
      t = t.to_sym
    end
    write_attribute(:product_type, Product.type(t))
  end
end
