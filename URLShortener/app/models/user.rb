class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many(
    :submitted_urls,
    class_name: 'Shortenedurl',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :visits,
    class_name: 'Visit',
    foreign_key: :user_id,
    primary_key: :id

  has_many :visited_urls,
    Proc.new { distinct },
    through: :visits,
    source: :shortenend_url

end
