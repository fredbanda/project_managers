class CommentsController < ApplicationController
  before_action :require_user

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment was added successfully"
      redirect_to project_path(@project)
    else
      @timeline_items = @project.timeline_items
      render "projects/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
