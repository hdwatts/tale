class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def index
    @tales = Tale.all
    @tales2 = @tales.select { |tale| !tale.awaiting_new_line? }
    @tales = @tales.select { |tale| !@tales2.include?(tale) }
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end