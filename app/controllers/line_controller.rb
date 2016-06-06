class LineController < ApplicationController
  def create
    tale = Tale.find(params[:tale])
    
    if @current_user.id != params[:id].to_i || !tale.awaiting_new_line?
      head :forbidden
    else
      line = Line.create(tale: tale, user: @current_user)
      ActionCable.server.broadcast 'lines',
        content: line.content,
        user_id: line.user.id,
        tale_id: tale.id,
        hide: true,
        owner_id: tale.owner.id
      head :ok
    end
  end

  def show
    tale = Tale.find(params[:tale].to_i)
    line = tale.lines.last

    if @current_user.id != params[:id].to_i ||
      !tale.is_current_line_user?(@current_user)

      head :forbidden
    else 
      ActionCable.server.broadcast 'lines',
        content: params[:content],
        user_id: line.user.id,
        tale_id: tale.id

      head :ok
    end
  end

  def update
    tale = Tale.find(params[:tale].to_i)
    line = tale.lines.last

    if @current_user.id != params[:id].to_i ||
      !tale.is_current_line_user?(@current_user)
      puts "#{@current_user.id} - #{params[:id]} - #{!tale.is_current_line_user?(@current_user)}"
      head :forbidden
    else
      line.update(strong_params)
      if line.save 
        if params[:closed] && @current_user = tale.owner
          tale.open = false
          tale.save
        end
        ActionCable.server.broadcast 'lines',
          content: line.content,
          user_id: line.user.id,
          tale_id: tale.id,
          user_link: line.user.html_link_to_user,
          done: line.done,
          tale_open: tale.open
        head :ok
      else
        head :bad_request
      end
    end
  end

  def strong_params
    params.permit(:content, :done)
  end
end