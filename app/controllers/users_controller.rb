class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

end
