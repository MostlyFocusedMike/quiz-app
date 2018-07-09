class TopicsController < ApplicationController

  def index
    render json: Topic.all
  end

  def show
    render json: Topic.find(params[:id])
  end
end
