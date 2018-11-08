class DogsController < ApplicationController
  before_action :find_dog, only: [:show]

  def index
    @dogs = Dog.all
  end

  def show
    @employees = @dog.employees.map { |e| e }
  end

  private

  def find_dog
    @dog = Dog.find_by(id: params[:id])
  end

end
