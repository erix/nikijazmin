class Picture < ActiveRecord::Base
  attr_accessible :desc, :name, :image
  belongs_to :album
  has_attached_file :image, :styles => { :thumb => "100x100>" }

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => image.url(:original),
      "thumbnail_url" => image.url(:thumb),
      "delete_url" => admin_album_picture_path(self.album_id, self),
      "delete_type" => "DELETE"
    }
  end

end
