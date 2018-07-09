class User < ApplicationRecord
  has_many :scores
  has_many :topics, through: :scores

  has_secure_password
end
