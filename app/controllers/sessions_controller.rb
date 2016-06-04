class SessionsController < ApplicationController
  
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to root, notice: "Invalid "
    end
  end

end