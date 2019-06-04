class UsersController < ApplicationController
  def show
    user = user.find(params[:id])
    @name = user.name
    @illustrations = user.illustrations.order("created_at DESC")
  end
end
