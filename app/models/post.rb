class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :taggings
  has_many :tags, through: :taggings
  before_save :assign_post_type

  validates :title, presence: true, length: { in: 10..100 }
  validates :content, presence: true
  validates :post_type, presence: true

  def assign_post_type
    self.post_type = 'C' if post_type.nil?
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end
