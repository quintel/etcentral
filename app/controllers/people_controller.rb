class PeopleController < ApplicationController
  def index
    @people = Person.all.sort
  end
  def show
    unless @person = Person.find(params[:id])
      raise ActionController::RoutingError.new('Person not Found')
    end
  end
end
