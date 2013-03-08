class AddIconToProduct < ActiveRecord::Migration
  def self.up
    remove_column :products, :icon
    add_attachment :products, :icon
  end

  def self.down
    remove_attachment :products, :icon
    add_column :products, :icon => :string
  end
end
