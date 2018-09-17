class IssuesController < ApplicationController

  def index
    @issues = Issue.all
  end 
    
  def show
    @issue = Issue.find(params[:id])
  end
    
  def new
    @issue = Issue.new
  end
    
  def create
    byebug
    @issue = Issue.new(issue_params)
    if @issue.save
      byebug
      redirect_to issues_path
    else
      render :new
      byebug
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end
  
  def update
    byebug
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      redirect_to issues_path(current_user), notice: 'Issue was successfully updated.'
    else
      render :edit
    end
  end
 
  def delete
    #byebug
    @issue = Issue.find(params[:id])
  end
    
  def destroy
    #byebug
    @issue = Issue.find(params[:id])
    @issue.delete
    
    #current_employee should be Admin at this point since only Admin should have access to destroy method
    redirect_to issues_path(current_user)   
  end
    
  private
    def require_admin
    #byebug
      redirect_to user_path(current_user) unless current_user.role === "Admin"
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(
      :title,
      :status,
      :owner,
      :created,
      :effort,
      :completion_date,
      :employee_id,
      :user_id
      )
    end

end
