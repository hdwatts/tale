class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:name])
    @tales = []
    if @tag
      @tales = @tag.tales
    end
  end
end
