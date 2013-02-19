class BooksController < ApplicationController
  def index
    books = Product.books
    coming_soon = Product.books.coming_soon
    released = books.select { |book| book.release_date }
    @books = coming_soon + released
  end
end
