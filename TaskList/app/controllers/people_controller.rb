class PeopleController < ApplicationController
  before_action :get_person, only: [:show, :show_tasks]

  def index
    @people = Person.all
  end

  def show
    @people = [@person]
  end

  def show_tasks
    @tasks = @person.tasks
  end

  private
    def get_person
      id = params[:id]
      @person = Person.find(id)
    end

end
