class CitiesController < ApplicationController
  def index
  end

  def show
    @city = City.find(params[:id])
    @gossips_arrray = Gossip.joins(:user).where(:user => User.where(city_id: params[:id]))
    @nb_members = User.where(city_id: @city.id).count
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
