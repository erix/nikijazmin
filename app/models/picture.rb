class Picture < ActiveRecord::Base
  attr_accessible :desc, :name, :image
  belongs_to :album
  has_attached_file :image, :styles =>
    {
      :large2x => "2048x2048>",
      :large => "1024x1024>",
      :thumb => "172x172#",
      :thumb2x => "344x344#"
    }

  include Rails.application.routes.url_helpers

  default_scope order('image_file_name ASC')

  def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => image.url(:original),
      "thumbnail_url" => image.url(:thumb),
      "delete_url" => album_picture_path(self.album_id, self),
      "delete_type" => "DELETE"
    }
  end

end
