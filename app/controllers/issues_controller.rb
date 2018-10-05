class IssuesController < ApplicationController
  before_action :exclude_guest, only: [:new, :create, :edit, :update, :delete, :destroy]

  def index
    if params[:user_id]
      @issues = User.find(params[:user_id]).issues.order_by_latest
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @issues, status: 200 }
      end
    else
      @issues = Issue.all.order_by_latest
    end
  end 
    
  #sort index output by effort
  def effort_sort
    @issues = Issue.all.order_by_effort  
    render :index  
  end

  def show
    @issue = Issue.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @issue, status: 200 }
    end
  end
    
  def new
    @issue = Issue.new
  end
    
  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to issues_path
    else
      render :new
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end
  
  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      redirect_to issues_path(current_user), notice: 'Issue was successfully updated.'
    else
      render :edit
    end
  end
 
  def delete
    @issue = Issue.find(params[:id])
  end
    
  def destroy
    @issue = Issue.find(params[:id])
    @issue.delete
    
    #current_employee should be Admin at this point since only Admin should have access to destroy method
    redirect_to issues_path(current_user)   
  end
    
  private
    def require_admin
      redirect_to user_path(current_user) unless current_user.role === "Admin"
    end
  
    def exclude_guest
      redirect_to issues_path(current_user) if current_user.role.downcase === "guest"
    end


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
