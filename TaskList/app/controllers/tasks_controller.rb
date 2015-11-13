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
    @action_url = "/tasks/"
    @method = :post
    Task.create(task_params[:task])
    redirect_to('/')
  end

  def destroy
    Task.delete(params[:id])
    redirect_to('/')
  end

  def edit
    @title = "Edit This Task"
    @method = :patch
    id = params[:id]
    @task = Task.find(id)
    @action_url = "/tasks/#{@task.id}"
    # @task = Task.new()
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(update_params[:task])
    redirect_to('/')
  end

  def toggle_completed
    id = params[:id]
    @task = Task.find(id)
    if @task.completed_date.nil?
      @task.update(completed_date: Time.now)
    else
      @task.update(completed_date: nil)
    end
    redirect_to('/')
  end

  private
  def task_params
    params.permit(task:[:name, :description, :completed_date])
  end

  def update_params
    params.permit(task: [:name, :description, :completed_date])
  end

end
