class FavoritesController < ApplicationController
  def new
    favorite = current_user.favorite.food.user.image(food_id: params[:food_id])
    redirect_to foods_path, notice: "#{favorite.food.user.name}お気に入り登録しました！"
  end

  def create
    favorite = current_user.favorites.create(food_id: params[:food_id])
    redirect_to foods_path, notice: "#{favorite.food.user.name}お気に入り登録しました！"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    redirect_to foods_path, notice: "#{favorite.food.user.name}記事を解除しました！"
  end
end
