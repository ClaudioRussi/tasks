class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :make_sure_user_is_collaborator
  before_action :set_task, only:[:show, :add_worker, :change_status]
  def new
    @group = Group.find(params[:group_id])
    @task = @group.tasks.build
  end

  def create
    @task = Task.new(task_params)
    @task.group = Group.find(params[:group_id])
    if @task.save
      flash[:notice] = "Task successfully created"
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end

  def show
  end

  def add_worker
    @task.workers << current_user
    if @task.save
      flash[:notice] = 'You are now working on this task'
      redirect_to task_path(@task)
    else
      flash[:notice] = "Something went wrong, please, try again later"
    end
  end

  def change_status
    @task.status = params[:next_status]
    @task.save
    redirect_back(fallback_location: root_path)
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def make_sure_user_is_collaborator
    if params[:id]
      project = Task.find(params[:id]).group.project
    else
      project = Group.find(params[:group_id]).project
    end
    unless project.collaborators.include?(current_user) or project.author == current_user
      flash[:notice]='You are not a collaborator'
      redirect_to root_path
    end
  end
end
