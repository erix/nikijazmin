class AddReleaseDateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :release_date, :date
  end
end
