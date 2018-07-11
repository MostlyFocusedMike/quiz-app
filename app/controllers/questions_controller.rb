class QuestionsController < ApplicationController

  def index
    topic = Topic.find(params[:topic_id])
    render json: topic.questions.shuffle[0...20]
  end

end
