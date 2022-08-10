class FavoritesController < ApplicationController
  before_action :set_food, only: [:create, :destroy]

  def index
    @foods = Food.includes(:food_images).order("created_at DESC")
  end

  def create
    @favorite = current_user.favorites.create(food_id: params[:food_id],user_id: current_user.id)
    redirect_to foods_path(@food.id)
  end

  def destroy
    @favorite = Favorites.find_by(food_id: params[:food_id],user_id: current_user.id)
    @favorite.destroy
    redirect_to foods_path(@food.id)
  end

  def set_food
    @food = Food.find(params[:food_id])
  end
end