class CommentsController < ApplicationController
  def create
    @comment = Comment.create!(comment_params)
    respond_to do |format|
      format.html {redirect_to illustration_path(params[:illustration_id])}
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(illustration_id: params[:illustration_id], user_id: current_user.id)
  end
end
