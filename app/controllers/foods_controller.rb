class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :check_admin, only: [:new, :edit, :update, :destroy, :create]

  def index
    @foods = Food.all.order(created_at: :desc)
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true).order(created_at: :desc)
    @foods = @foods.page(params[:page]).per(8)
  end

  def show
    @favorite = Favorite.find_by(food_id: @food.id)
  end

  def new
    @food = Food.new
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      NoticeMailer.sendmail_food(@food).deliver
      redirect_to foods_path, notice: 'フードを新規登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "フードの更新をしました" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "フードを削除しました" }
    end
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:item_name, :variety, :comment, :storage_method, :harvest, :price, :stock, images: [])
    end

    def check_admin
      return if current_user.admin
      redirect_to root_path
    end
end
