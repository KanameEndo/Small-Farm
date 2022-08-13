class UsersController < ApplicationController

  def show
    @user = current_user
    @foods = @user.foods

    favorites = Favorite.where(user_id: current_user.id).pluck(:food_id)  # ログイン中のユーザーのお気に入りのFood_idカラムを取得
    @favorite_list = Food.find(favorites)     # Foodsテーブルから、お気に入り登録済みのレコードを取得
  end
end
