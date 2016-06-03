class TalesController < ApplicationController
  def show
  end

  def new
    @tale = Tale.new
    @tale.lines.build
    # @tale.tags.build
  end

  def create
    @tale = Tale.new(tale_params)
    if @tale.save
      redirect_to tale_path(@tale)
    else
      @tale.errors.full_messages.each { |error| "#{error}" }
      render 'new'
    end
  end

private
  
  def tale_params
    params.require(:tale).permit(:prompt, :lines_attributes[0][:content], :tags_tales[:tags])
  end

end