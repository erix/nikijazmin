class Product < ActiveRecord::Base
  TYPES = {:book => 0, :app => 1}
  has_many :reviews, :dependent => :destroy

  attr_accessible :banner, :desc, :icon, :mini_banner, :wide_banner, :name, :store_link, :in_slider, :product_type, :release_date, :locale

  has_attached_file( :icon,
    :styles =>
    lambda do |icon|
      if icon.instance.app?
        {
          :large => '50%',
          :small => '57x57>',
          :small2x => '114x114>'
        }
      else
        # book
        {
          :large => '50%'
        }
      end
    end)

  scope :coming_soon, where(:release_date => nil)
  scope :books, where(:product_type => TYPES[:book])
  scope :apps, where(:product_type => TYPES[:app])

  # use lambda to get around the caching to have current values
  scope :new_products, ->{where(:release_date  => (Time.now.midnight - 1.month)..Time.now.midnight)}
  default_scope order('release_date DESC')

  def self.type(t)
    TYPES[t]
  end

  def product_type=(t)
    # accept string, symbol and number
    if t.class == String
      t = Product.type(t.to_sym) || t.to_i
    elsif t.class == Symbol
      t = Product.type(t)
    end
    write_attribute(:product_type, t)
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
