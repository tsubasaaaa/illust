class IllustrationsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def show
  end

  private
  def illustrations_params
    params.require(:illustration).permit(:title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index
  end

end
