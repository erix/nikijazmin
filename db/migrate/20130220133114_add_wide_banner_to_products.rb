class AddWideBannerToProducts < ActiveRecord::Migration
  def change
    add_column :products, :wide_banner, :string
  end
end
