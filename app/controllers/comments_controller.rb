class CommentsController < ApplicationController
  before_action :set_plan, only: [:create, :edit, :update]

  def create
    @plan = Plan.find(params[:plan_id])
    @comment = @plan.comments.build(comment_params)
    # @comment = current_user

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to plan_path(@plan), notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    @comment = @plan.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @plan.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  def set_plan
    @plan = Plan.find(params[:plan_id])
  end
end
