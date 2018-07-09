class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :high_scores

  def high_scores
    self.object.scores.sort_by{|obj| obj.score}.reverse[0..2].map do |score|
      {user: score.user.name, score: score.score}
    end
  end
end
