class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update]
  def index
    @employees = Employee.all
  end

  def show
    # @employee = Employee.find_by(id: params[:id]) # refactor when ur done w before action
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.valid?
      @employee.save
      redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
    @employee = Employee.find_by(id: params[:id]) # refactor when ur done w before action
    @dogs = Dog.all
  end

  def update
      @employee = Employee.find_by(id: params[:id])
      @employee.update(employee_params)
      if @employee.valid?
        @employee.save
        redirect_to @employee
      else
        flash[:errors] = @employee.errors.full_messages
        redirect_to edit_employee_path
      end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
  end

  def find_employee
    @employee = Employee.find_by(id: params[:id])
  end


end
