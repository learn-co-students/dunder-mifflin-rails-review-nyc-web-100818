class EmployeesController < ApplicationController
  before_action :find_employee, only: %i[show edit update destroy]
  def index
    @employees = Employee.all
  end

  def show
    # @employee = Employee.find_by(params[:id])
  end

  def edit
    # @employee = Employee.find_by(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def update
    # @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to employee_path(@employee)
  end

  # def destroy
  #   @employee.destroy
  #   flash[:notice] = 'Employee Deleted!!!'
  #   redirect_to employees_path
  # end
  # Just Kidding

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url)
  end

  def find_employee
    @employee = Employee.find_by(params[:id])
  end
end
