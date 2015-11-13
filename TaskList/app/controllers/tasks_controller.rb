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
    @tasks = Task.where(id: id)
    @task = @tasks[0]

  end

  private
  def task_params
    params.permit(task:[:name, :description])
  end

end
