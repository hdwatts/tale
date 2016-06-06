class LineController < ApplicationController
  def create
    tale = Tale.find(params[:tale])
    
    if @current_user.id != params[:id].to_i ||
      !tale.awaiting_new_line?
      
      head :forbidden
    else
      line = Line.create(tale: tale, user: @current_user)
      ActionCable.server.broadcast 'lines',
        content: line.content,
        user_id: line.user.id,
        tale_id: tale.id,
        hide: true
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

      head :forbidden
    else
      line.update(strong_params)
      if line.save
        ActionCable.server.broadcast 'lines',
          content: line.content,
          user_id: line.user.id,
          tale_id: tale.id,
          user_link: "#{link_to(line.user.username, line.user)}",
          done: line.done

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