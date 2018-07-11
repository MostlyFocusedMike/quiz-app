class User < ApplicationRecord
  has_many :scores
  has_many :topics, through: :scores

  validates :username, uniqueness: true

  has_secure_password
end
