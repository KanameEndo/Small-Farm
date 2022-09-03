class CommentsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    @comment = @plan.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to plan_path(@plan) }
      else
        format.html { redirect_to plan_path(@plan), notice: '投稿できませんでした' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
