class TalesController < ApplicationController

  def new
    @tale = Tale.new
    @line = @tale.lines.build
    @tags = Tag.new
  end

  def create
    @tale = TaleCreator.create_tale(tale_params, current_user)
    if @tale.save
      the_tale = @tale
      @tag = TagCreator.create_tags(tag_params, the_tale)
      redirect_to @tale
    else
      @tale.errors.full_messages.each { |error| "#{error}" }
      render 'new'
    end
  end

  def show
    @tale = TaleDecorator.new(Tale.find(params[:id]))
  end

  def edit
    @tale = Tale.find(params[:id])
    @tags = @tale.tags
  end

  def index
    @tales = Tale.all
    @random_tale = Tale.all.sample
  end

  def destroy
    @tale = Tale.find(params[:id])
    if @tale.owner == current_user
      @tale.destroy
      redirect_to new_session
    end
  end

private
  
  def tale_params
    params.require(:tale).permit(:prompt, :title, :owner_id, lines_attributes: [:id, :content])
  end

  def tag_params
   params[:tale][:tag][:name].split(",")
  end

end