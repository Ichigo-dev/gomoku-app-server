class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: { user: user }
  end

  def create
    user = User.new(name: params[:name])
    if user.save
      render json: {user: user}
    else
      render json: {err: user.errors}
    end
  end
end
