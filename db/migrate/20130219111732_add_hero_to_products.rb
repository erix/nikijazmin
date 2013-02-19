class AddHeroToProducts < ActiveRecord::Migration
  def change
    add_column :products, :in_slider, :boolean
  end
end
