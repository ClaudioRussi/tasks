class TasksController < ApplicationController
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
    @task = Task.find(params[:id])
  end

  def add_worker
    @task = Task.find(params[:id])
    @task.workers << current_user
    if @task.save
      flash[:notice] = 'You are now working on this task'
      redirect_to task_path(@task)
    else
      flash[:notice] = "Something went wrong, please, try again later"
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
