class LineController < ApplicationController
  def create
  end
  def update
    line = Line.first
    line.update(content: params[:content])
    if line.save
      ActionCable.server.broadcast 'lines',
        content: line.content,
        user: line.user.first_name
      head :ok
    end
  end

  def strong_params
    params.require(:line).permit(:content)
  end
end