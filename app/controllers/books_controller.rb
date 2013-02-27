class BooksController < ApplicationController
  def index
    books = Product.books.where(:locale  => I18n.locale)
    coming_soon = Product.books.coming_soon.where(:locale  => I18n.locale)
    released = books.select { |book| book.release_date }
    @books = coming_soon + released
  end
end
