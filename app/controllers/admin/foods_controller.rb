class Admin::FoodsController < ApplicationController
  before_action :if_not_admin
  before_action :set_food, only: [:show, :edit, :destroy]

    def index
      @foods = Food.all
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

    def if_not_admin
      redirect_to root_path unless current_user.admin?
    end

    def set_food
      @food = Food.find(params[:id])
    end

end
