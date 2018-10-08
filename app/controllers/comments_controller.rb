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

  # def show
  #   @comments = @issue.comments
  #   @comment = Comment.new
  # end

  def create
    @comment = @issue.comments.build(comments_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render "issue/show"
    end

  end

  private
    def set_issue 
      @issue = Issue.find(params[:issue_id])
    end

    def comments_params
      params.require(:comment).permit(:comment, :issue_id, :user_id)
    end

end