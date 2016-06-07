class SessionsController < ApplicationController
  
  def new
    redirect_to @current_user if @current_user
  end
  
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'users/signin', error: "Invalid username or password"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to new_session_path
  end
end