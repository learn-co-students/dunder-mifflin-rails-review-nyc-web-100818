class DogsController < ApplicationController
  #need an index page
  #index should link to show
  #show page should have name, breed, age, and employee associated
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find_by(id: params[:id])
  end

end
