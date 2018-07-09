class Topic < ApplicationRecord
  has_many :scores
  has_many :users, through: :scores
  has_many :questions 
end
