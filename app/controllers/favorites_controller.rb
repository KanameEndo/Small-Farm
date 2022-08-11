class FavoritesController < ApplicationController
  before_action :set_food
  before_action :authenticate_user!

  def index
    @foods = Food.includes(:food_images).order("created_at DESC")
  end

  def create
    Favorite.create(user_id: current_user.id, food_id: params[:id])
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, food_id: params[:id]).destroy
  end

  def set_food
    @food = Food.find_by(id: params[:id])
  end
end