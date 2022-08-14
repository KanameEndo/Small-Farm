class UsersController < ApplicationController

  def show
    @user = current_user
    @foods = @user.foods

    favorites = Favorite.where(user_id: current_user.id).pluck(:food_id)  # ログイン中のユーザーのお気に入りのFood_idカラムを取得
    @favorite_list = Food.find(favorites)     # Foodsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
