class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :tweets, foreign_key: 'id'
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
