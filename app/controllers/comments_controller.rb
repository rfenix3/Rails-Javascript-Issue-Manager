class CommentsController < ApplicationController
  before_action :set_issue

  def index
    @comments = @issue.comments
    # respond_to do |format|
    #   format.html { render "/issues/show" }
    #   format.json { render json: @issue, status: 200 }
    # end
    # render "/comments/index", :layout => false
    render json: @comments
  end

  private
    def set_issue 
      @issue = Issue.find(params[:issue_id])
    end

end