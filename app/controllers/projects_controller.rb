class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :make_sure_user_is_author, only:[:add_collaborator]
  before_action :make_sure_user_is_collaborator, only:[:show]

  def show
      @connections_to_add = current_user.accepted_connections.map do |connection|
        if !@project.collaborators.include?(connection)
          ["#{connection.full_name}(#{connection.email})", connection.id]
        end
      end
  end

  def index
    @projects = current_user.authored_projects.includes(:author, :groups, :tasks, :collaborators)
    @collaborating_projects = current_user.collaborating_projects.includes(:author, :groups, :tasks, :collaborators)
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.authored_projects.build(project_params)
    if @project.save
      flash[:notice]='Project created successfully'
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def add_collaborator
    @project.collaborators << User.find(params[:collaborator_id])
    if @project.save
      flash[:notice] = 'Collaborator successfully added to this project'
    end
    redirect_to project_path @project

  end


  private
  def project_params
    params.require(:project).permit([:name, :description])
  end

  def make_sure_user_is_author
    @project = Project.find(params[:id])
    unless @project.author == current_user
      flash[:notice] = 'You cannot access to this project'
      redirect_to root_path
    end
  end

  def make_sure_user_is_collaborator
    @project = Project.eager_load(:author, :tasks, :collaborators, :groups).find(params[:id])
    unless @project.collaborators.include?(current_user) or @project.author == current_user
      flash[:notice] = 'You are not a collaborator'
      redirect_to root_path
    end
  end

end
