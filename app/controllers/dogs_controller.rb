class DogsController < ApplicationController
  # before_action :find_dog, only: [:show]

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find_by(id: params[:id])
    @owners = @dog.employees
  end

  



end
