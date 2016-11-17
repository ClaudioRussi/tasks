class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :make_sure_user_is_collaborator, only:[:create]
  def new
    @project = Project.find(params[:project_id])
    @group = @project.groups.build
  end

  def create
    @group = @project.groups.build(group_params)
    if @group.save
      flash[:notice] = 'Group successfully created'
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def make_sure_user_is_collaborator
    @project = Project.find(params[:project_id])
    unless @project.collaborators.include?(current_user) or @project.author == current_user
      flash[:notice] = 'You are not a collaborator'
      redirect_to root_path
    end
  end
end
