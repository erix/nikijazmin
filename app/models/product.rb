class Product < ActiveRecord::Base
  TYPE = {:book => 0, :app => 1}

  attr_accessible :banner, :desc, :icon, :mini_banner, :name, :store_link, :in_slider, :product_type, :release_date
  attr_accessible :banner, :desc, :icon, :mini_banner, :wide_banner, :name, :store_link, :in_slider, :product_type, :release_date

  scope :coming_soon, where(:release_date => nil)
  scope :new, where(:release_date  => (Time.now.midnight - 1.month)..Time.now.midnight)
  scope :books, where(:product_type => "book")
  scope :apps, where(:product_type => "app")

  default_scope order('release_date DESC')

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
