class Tweet < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  validates :text, presence: true, length: { maximum: 140 }
end
