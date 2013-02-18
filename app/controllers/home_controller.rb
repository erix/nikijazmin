class HomeController < ApplicationController
  def index
    @hero_products = Product.all
  end
end
