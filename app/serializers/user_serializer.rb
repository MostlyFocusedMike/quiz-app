class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :scores

  def scores
    arr = self.object.scores.map do |score|
      {topic: score.topic.title, score: score.score, id: score.id}
    end
    arr.sort{ |a,b| a[:score] <=> b[:score] }.reverse[0..2]
  end

end
