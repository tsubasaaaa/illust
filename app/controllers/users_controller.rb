class UsersController < ApplicationController
  def show
    user = user.find(params[:id])
    @name = user.name
    @illustrations = user.illustrations.page(params[:page]).per(5).order("created_at DESC")
  end
end
