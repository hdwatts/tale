class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_new_user, only: [:new, :create]
  

  def create
    debugger
    if @user.save
      TaleMailer.welcome_email(@user).deliver
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    redirect_to root_path unless @user == current_user
  end

  def show
    @user = UserDecorator.new(@user)
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_new_user(user_params = nil)
    @user = User.new(user_params)
  end

end
