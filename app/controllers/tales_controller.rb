class TalesController < ApplicationController

  before_action :set_tale, only: [:show, :edit]
  before_action :require_login, except: [:show, :index]
  def new
    @tale = Tale.new
    @line = @tale.lines.build
    @tags = Tag.new
  end

  def create
    @tale = TaleCreator.create_tale(tale_params, current_user)
    if @tale.save
      TagCreator.create_tags(tag_params, @tale)
      redirect_to @tale
    else
      @tale.errors.full_messages.each { |error| "#{error}" }
      render 'new'
    end
  end

  def show
    @tale = TaleDecorator.new(@tale)
  end

  def edit
    @tags = @tale.tags
  end

  def index
    @tales = Tale.all
    @random_tale = @tales.sample
  end

  def destroy
    @tale = current_user.tales.find(params[:id])
    @tale.destroy
    redirect_to tales_path, notice: "Your tale has been deleted."
  end

private
  def tale_params
    params.require(:tale).permit(:prompt, :title, :owner_id, lines_attributes: [:id, :content])
  end

  def tag_params
   params[:tale][:tag][:name].split(",")
  end

  def set_tale
    @tale = Tale.find(params[:id])
  end

  def require_login
    redirect_to new_session_path, notice: "You have to log in first." unless current_user
  end

end