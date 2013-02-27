class AppsController < ApplicationController
  def index
    apps = Product.apps.where(:locale  => I18n.locale)
    coming_soon = Product.apps.coming_soon.where(:locale  => I18n.locale)
    released = apps.select { |app| app.release_date }
    @apps = coming_soon + released
  end
end
