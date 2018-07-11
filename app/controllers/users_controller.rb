class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
#     fetch("http://localhost:3000/users", {
# 	method: "POST",
#     headers: {
#         "content-type": "application/json",
#         "accept": "application/json"
#     },
#     body: JSON.stringify({user:{name: "Travis", password: "1234"}})
# }).then(r => r.json()).then(console.log)
# Promise {<pending>}
# {id: 22, name: "Travis", scores: Array(0)}id: 22name: "Travis"scores: []__proto__: Object
    @user = User.create(user_params)
    if @user
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def update

  end

  def delete

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
