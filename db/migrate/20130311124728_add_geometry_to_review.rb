class AddGeometryToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :images_geometry, :string
  end
end
