class UsersController < ApplicationController


  def welcome
  end

  def create
    user = User.new(user_params)
    if user.save 
      session[:user_id] = user.id
      flash[:notice] = "You're logged in!"
      redirect_to root_path
    else 
      flash[:notice] = "Dat ish was invalid, yo"
      redirect_to root_path
    end
  end

  
private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end


end
