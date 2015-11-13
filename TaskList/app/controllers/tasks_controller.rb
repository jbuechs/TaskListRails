class TasksController < ApplicationController
  def index
    @title = "Task List"
    @tasks = Task.all
  end

  def show
    @title = "About This Task"
    id = params[:id]
    @tasks = Task.where(id: id)
  end

  def new
    @title = "Add a Task"
    @task = Task.new()
  end

  def create
    Task.create(task_params[:task])
    redirect_to('/')
  end

  def destroy
    Task.delete(params[:id])
    redirect_to('/')
  end

  def edit
    @title = "Edit This Task"
    id = params[:id]
    @task = Task.find(id)
    # @task = Task.new()
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(update_params[:task])
    redirect_to('/')
  end

  private
  def task_params
    params.permit(task:[:name, :description])
  end

  def update_params
    params.permit(task: [:name, :description])
  end

end
