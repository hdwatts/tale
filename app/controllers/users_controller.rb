class UsersController < ApplicationController


  def welcome
  end

  def create
    user = User.new(user_params)
    if user.save 
      redirect_to welcome_path
    else 
      redirect_to signup_path, notice: "Dat ish was invalid, yo"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  
private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end


end
