class CommentsController < ApplicationController
  def create
    comment = Comment.create(text: comment_params[:text], illustration_id: comment_params[:illustration_params], user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to illustration_path(params[:illustration_id])}
      format.json
  end

  private
  def comment_params
    params.permit(:comment, :illustration_id)
  end
end
