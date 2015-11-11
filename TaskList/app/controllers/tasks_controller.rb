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
end
