class Score < ApplicationRecord
  belongs_to :topic
  belongs_to :user 

end
