class GroupsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @group = @project.groups.build
  end

  def create
    @project = Project.find(params[:project_id])
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
end
