class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @illustrations = user.illustrations.order("created_at DESC")
  end
end
