class UsersController < ApplicationController


  def welcome
  end

  def create
    user = User.new(user_params)
    if user.save 
      session[:user_id] = user.id
      redirect_to welcome_path, notice: "You're logged in!"
    else 
      redirect_to signup_path, notice: "Dat ish was invalid, yo"
    end
  end

  
private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end


end
