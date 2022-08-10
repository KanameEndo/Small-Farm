class FavoritesController < ApplicationController
  before_action :set_food
  before_action :authenticate_user!

  def index
    @foods = Food.includes(:food_images).order("created_at DESC")
  end

  def create
    if @food.user_id != current_user.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(user_id: current_user.id, food_id: @food.id)
    end
  end

  # def create
  #   @favorite = current_user.favorites.create(food_id: params[:food_id])
  #   redirect_back(fallback_location: root_path )
  # end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, food_id: @food.id)
    @favorite.destroy
  end

  # def destroy
  #   @food = Food.find(params[:food_id])
  #   @favorite = current_user.favorites.find_by(food_id: @food.id)
  #   @favorite.destroy
  #   redirect_back(fallback_location: root_path )
  end

  def set_food
    @food = Food.find(params[:food_id])
  end
end