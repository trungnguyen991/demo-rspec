class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id]) rescue nil
    if @employee
      if @employee.update_attributes(employee_params)
        redirect_to employees_path
      else
        render 'edit'
      end
    else
      redirect_to employees_path
    end
  end

  def destroy
    @employee = Employee.find(params[:id]) rescue nil
    if @employee.destroy
      redirect_to employees_path
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:code, :name, :email, :address, :gender, :phone_number, :dob)
    end
end
