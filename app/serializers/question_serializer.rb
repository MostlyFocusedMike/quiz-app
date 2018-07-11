class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :answers, :topic_id

  def answers
    arr = []
    arr.push({answer: self.object["correct_answer"], correct: true})
    arr.push({answer: self.object["wrong1"], correct: false})
    arr.push({answer: self.object["wrong2"], correct: false})
    arr.push({answer: self.object["wrong3"], correct: false})
    arr.shuffle
  end
end
