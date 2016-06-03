class SessionsController < ApplicationController
  
  def create
    @user = User.find_by(params[:user_id])
    session[:user_id] = @user.id
  end

end