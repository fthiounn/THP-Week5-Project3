class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @city = City.find(@user.city_id)
    @nb_gossips = Gossip.where(user_id: @user.id).count
    @nb_comments = Comment.where(user_id: @user.id).count
    @gossips_arrray = Gossip.where(user_id: @user.id)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
