class PlansController < ApplicationController
  def index
    @plans = Plan.all
    @plan = Plan.new
  end

  def new
    @plan = Plan.new
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = current_user.plans.build(plan_parameter)
    if @plan.save
      redirect_to plans_path
    else
      render :new
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path, notice:"削除しました"
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_parameter)
      redirect_to plans_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def plan_parameter
    params.require(:plan).permit(:title, :content, :start_time)
  end

end
