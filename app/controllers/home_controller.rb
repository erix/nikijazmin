class HomeController < ApplicationController
  def index
    @hero_products = Product.where(:in_slider => true, :locale => I18n.locale)
  end
end
