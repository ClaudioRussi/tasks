class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    if current_user.accepted_connections
      @connections_to_add = current_user.accepted_connections.map do |connection|
        if !@project.collaborators.include?(connection)
          [connection.email, connection.id]
        end
      end
    end
  end

  def index
    @projects = current_user.authored_projects
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
    @project = Project.find(params[:id])
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
end
