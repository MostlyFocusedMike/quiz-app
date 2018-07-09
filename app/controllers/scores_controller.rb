class ScoresController < ApplicationController

  def index
    render json: Score.all
  end
  def show
    render json: Score.find(params[:id])
  end

  def create
    render json: Score.create(score_params)
  end

  private

  def score_params
    params.require(:score).permit(:score, :user_id, :topic_id)
  end
end
