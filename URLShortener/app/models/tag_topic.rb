class TagTopic < ApplicationRecord
  validates :name, presence: true

  has_many :taggings,
    class_name: :Tagging,
    foreign_key: :tag_topic_id,
    primary_key: :id

  has_many :urls,
    through: :taggings,
    source: :shortenedurl

  def popular_links
    
  end
end
