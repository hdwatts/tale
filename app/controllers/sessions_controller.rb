class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to root_path, notice: "Invalid"
    end
  end
end