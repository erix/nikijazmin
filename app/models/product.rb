class Product < ActiveRecord::Base
  TYPES = {:book => 0, :app => 1}

  attr_accessible :banner, :desc, :icon, :mini_banner, :wide_banner, :name, :store_link, :in_slider, :product_type, :release_date, :locale

  scope :coming_soon, where(:release_date => nil)
  scope :books, where(:product_type => TYPES[:book])
  scope :apps, where(:product_type => TYPES[:app])

  # use lambda to get around the caching to have current values
  scope :new_products, ->{where(:release_date  => (Time.now.midnight - 1.month)..Time.now.midnight)}
  default_scope order('release_date DESC')

  def self.type(t)
    TYPES[t]
  end

  # def product_type
  #   TYPES.key(read_attribute(:product_type))
  # end

  def product_type=(t)
    # accept string, symbol and number
    if t.class == String
      t = t.to_sym
    elsif t.class == Fixnum
      t = Product.type(t)
    end
    write_attribute(:product_type, Product.type(t))
  end

  def app?
    product_type == TYPES[:app]
  end

  def book?
    product_type == TYPES[:book]
  end

  def coming_soon?
    store_link.nil?
  end
end
