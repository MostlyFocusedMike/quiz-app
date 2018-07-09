class QuestionsController < ApplicationController

  def index
    render json: Question.all.shuffle[0..20]
  end

end
