class AppsController < ApplicationController
  def index
    apps = Product.apps
    coming_soon = Product.apps.coming_soon
    released = apps.select { |app| app.release_date }
    @apps = coming_soon + released
  end
end
