class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :scores

  def scores
    self.object.scores.map do |score|
      {topic: score.topic.title, score: score.score}
    end
  end

end
