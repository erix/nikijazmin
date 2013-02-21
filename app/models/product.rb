class Product < ActiveRecord::Base
  TYPE = {:book => 0, :app => 1}

  attr_accessible :banner, :desc, :icon, :mini_banner, :wide_banner, :name, :store_link, :in_slider, :product_type, :release_date, :locale

  scope :coming_soon, where(:release_date => nil)
  scope :books, where(:product_type => TYPE[:book])
  scope :apps, where(:product_type => TYPE[:app])

  # use lambda to get around the caching to have current values
  scope :new_products, ->{where(:release_date  => (Time.now.midnight - 1.month)..Time.now.midnight)}
  default_scope ->{order('release_date DESC').where(:locale  => I18n.locale)}

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

  def app?
    product_type == :app
  end

  def book?
    product_type == :book
  end

  def coming_soon?
    store_link.nil?
  end
end
