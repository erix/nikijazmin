class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.string :icon
      t.string :banner
      t.string :mini_banner
      t.string :store_link

      t.timestamps
    end
  end
end
