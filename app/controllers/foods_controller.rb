class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true)
  end

  def show
    @favorite = current_user.favorites.find_by(food_id: @food.id)
  end

  def new
    @food = Food.new
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      NoticeMailer.sendmail_food(@food).deliver_later
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "Food was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
    end
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:item_name, :variety, :comment, :storage_method, :harvest, :price, :stock, :image)
    end
end
