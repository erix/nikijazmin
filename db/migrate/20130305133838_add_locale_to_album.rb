class AddLocaleToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :locale, :string, :default => "en"
  end
end
