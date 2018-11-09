class EmployeesController < ApplicationController
  #no destroy action currently.
  before_action :find_emp, only: [:show, :edit, :update]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.create(employee_params)
      if @employee.valid?
        redirect_to employee_path(@employee) #or just redirect_to @employee
      else
        flash[:errors] = @employee.errors.full_messages
        redirect_to new_employee_path
      end
  end

  def show
    @dog = @employee.dog
  end

  def edit
    @dogs = Dog.all
  end

  def update
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end
  end

  # def destroy
  #   #code
  # end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

  def find_emp
    @employee = Employee.find_by(id: params[:id])
  end


end
