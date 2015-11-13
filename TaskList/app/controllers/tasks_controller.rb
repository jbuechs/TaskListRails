class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :update, :toggle_completed]

  def index
    @title = "Task List"
    @tasks = Task.all
  end

  def show
    @title = "About This Task"
    @tasks = [@task]
  end

  def new
    @title = "Add a Task"
    @task = Task.new()
  end

  def create
    @action_url = "/tasks/"
    @method = :post
    @task = Task.new(task_params[:task])
    if @task.save
      redirect_to('/')
    else
      render 'new'
    end
  end

  def destroy
    Task.delete(params[:id])
    redirect_to('/')
  end

  def edit
    @title = "Edit This Task"
    @method = :patch
    @action_url = "/tasks/#{@task.id}"
  end

  def update
    if @task.update(task_params[:task])
      redirect_to('/')
    else
      @title = "Edit This Task"
      @method = :patch
      @action_url = "/tasks/#{@task.id}"
      render 'edit'
    end
  end

  def toggle_completed
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

  def get_task
    id = params[:id]
    @task = Task.find(id)
  end

end
