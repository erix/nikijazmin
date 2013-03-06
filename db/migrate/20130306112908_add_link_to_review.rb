class AddLinkToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :link, :string
  end
end
