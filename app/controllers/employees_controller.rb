class EmployeesController < ApplicationController
    before_action :require_admin

  def index
    @employees = Employee.all
  end 

  def show
    @employee = Employee.find(params[:id])
  end

  def new
  # only Admin can create new employee when logged in
  # logged-in users will not have access to new and create employee methods
    if current_user && current_user.role != "Admin"
      redirect_to user_path(current_user)
    end
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      #byebug
      if current_user.role != "Admin"
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome to Issue Manager!"
      else
      # Admin is redirected to employees index after creating a employee.
        redirect_to employees_path
      end
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'employee was successfully updated.'
    else
      render :edit
    end
  end

  def delete
  #byebug
  @employee = Employee.find(params[:id])
  end

  def destroy
  #byebug
    @employee = Employee.find(params[:id])
    @employee.delete

    #current_employee should be Admin at this point since only Admin should have access to destroy method
    redirect_to employees_path(current_user)   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    def require_admin
    #byebug
      redirect_to user_path(current_user) unless current_user.role === "Admin"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(
      :name,
      :department
      )
    end

end
