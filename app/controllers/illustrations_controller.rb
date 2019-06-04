class IllustrationsController < ApplicationController
  def index
    @illustrations = Illustration.all.reverse
    # .includes(:user)
  end

  def new
    @illustration = Illustration.new
  end

  def create
    Illustration.create(illustration_params)
  end

  def destroy
    illustration = Illustration.find(params[:id])
    illustration.destroy if illustration.user_id == current_user.id

  end

  def edit
    @illustration = Illustration.find(params[:id])
  end

  def update
    illustration = Illustration.find(params[:id])
    illustration.update(illustration_params)
  end

  def show
    @illustration = Illustration.find(params[:id])
    @comment = Comment.new
    @comments = @illustration.comments.includes(:user)
  end

  private
  def illustration_params
    params.require(:illustration).permit(:title, :text, :image).merge(user_id: current_user.id )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
