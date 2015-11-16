class PeopleController < ApplicationController
  # before_action :get_person, only: [:show]

  def index
    @people = Person.all
  end

  def show
    id = params[:id]
    @person = Person.find(id)
    @people = [@person]
  end

  def new

  end

  # private
  #   def get_person
  #     id = params[:id]
  #     @person = Person.find(id)
  #   end

end
