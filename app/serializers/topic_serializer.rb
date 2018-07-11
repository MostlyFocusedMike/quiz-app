class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :scores

  def scores
    self.object.scores.sort_by{|obj| obj.score}.reverse[0..2].map do |score|
      {user: score.user.name, score: score.score, id: score.id}
    end
  end

end
