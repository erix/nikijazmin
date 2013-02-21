class ChangeDataTypeForDescInProducts < ActiveRecord::Migration
  def up
    change_column :products, :desc, :text
  end

  def down
    change_column :products, :desc, :string
  end
end
