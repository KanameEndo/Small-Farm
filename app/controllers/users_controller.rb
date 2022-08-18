class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to user_path(@user.id)
      else
        render :new
    end
  end

  def show
    @user = current_user
    @foods = @user.foods

    favorites = Favorite.where(user_id: current_user.id).pluck(:food_id)  # ログイン中のユーザーのお気に入りのFood_idカラムを取得
    @favorite_list = Food.find(favorites)     # Foodsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    # @user = current_user
    @user = User.find(params[:id])
  end

  def update
    # @user = current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_show_path(@user.id), notice:'プロフィール編集しました'
    else
      render :edit
    end
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
