class BooksController < ApplicationController
  def index
    @books = Product.find_all_by_product_type(Product.type(:book))
  end
end
