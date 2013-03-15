class Post < ActiveRecord::Base
  attr_accessible :title, :text, :published_at, :locale

  scope :published, where("published_at IS NOT NULL")
  default_scope order("published_at DESC")

  def published?
    self.published_at.present?
  end
end
