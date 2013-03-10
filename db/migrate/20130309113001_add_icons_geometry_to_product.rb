class AddIconsGeometryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :icons_geometry, :string
  end
end
