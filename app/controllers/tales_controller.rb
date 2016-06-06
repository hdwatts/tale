class TalesController < ApplicationController

  def new
    @tale = Tale.new
    @line = @tale.lines.build
    @tag = @tale.tags.build
  end

  def create
    @tale = Tale.new(tale_params)
    @tale.lines.first.user_id = current_user.id 
    @tale.owner_id = current_user.id
    if @tale.save!
      redirect_to @tale
    else
      @tale.errors.full_messages.each { |error| "#{error}" }
      render 'new'
    end
  end

  def show
    @tale = TaleDecorator.new(Tale.find(params[:id]))
  end

  def index
    @tales = Tale.all
  end

private
  
  def tale_params
    params.require(:tale).permit(:prompt, :owner_id, lines_attributes: [:id, :content], tags_attributes: [:name])
  end

end