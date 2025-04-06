class ProjectsController < ApplicationController
  before_action :require_user
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.all
  end

  def show
    @comment = Comment.new
    @timeline_items = @project.timeline_items
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      # Create initial status change
      StatusChange.create(
        from_status: "None",
        to_status: @project.status,
        reason: "Project created",
        user: current_user,
        project: @project
      )
      flash[:notice] = "Project was created successfully"
      redirect_to @project
    else
      render :new
    end
  end

  def edit
  end

  def update
    old_status = @project.status
    if @project.update(project_params)
      # Create status change if status changed
      if old_status != @project.status
        StatusChange.create(
          from_status: old_status,
          to_status: @project.status,
          reason: params[:status_change_reason] || "Status updated",
          user: current_user,
          project: @project
        )
      end
      flash[:notice] = "Project was updated successfully"
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project was deleted successfully"
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :status)
  end
end
