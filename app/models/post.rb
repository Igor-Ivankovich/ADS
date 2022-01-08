class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  before_save :assign_post_type

  def assign_post_type
    self.post_type = 'C' if post_type.nil?
  end
end
