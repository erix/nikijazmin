class Post < ActiveRecord::Base
  attr_accessible :title, :text, :published_at

  scope :published, where("published_at IS NOT NULL")

  def published?
    self.published_at.present?
  end
end
