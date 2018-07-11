class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :scores

  def scores
    self.object.scores.map do |score|
      {topic: score.topic.title, score: score.score, id: score.id}
    end
  end

end
