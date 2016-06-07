class LineController < ApplicationController

  before_action :set_tale
  before_action :set_line, only: [:show, :update]

  def create
    return head :forbidden if invalid_new_line?
    @line = Line.create(tale: @tale, user: @current_user)
    ActionCableBroadcaster.new(@line).create_line_broadcast
    head :ok
  end

  def show
    return head :forbidden if invalid_line?
    ActionCableBroadcaster.new(@line, params[:content]).show_line_broadcast
    head :ok
  end

  def update
    params[:content].gsub!(/\</, "&lt;")
    params[:content].gsub!(/\>/, "&gt;")
    params[:content].gsub!(/\n/, "<br>")
    return head :forbidden if invalid_line?
    return head :bad_request unless @line.update(strong_params)
    @tale.close if ready_to_close?
    ActionCableBroadcaster.new(@line).update_line_broadcast
    head :ok
  end

  private

  def strong_params
    params.permit(:content, :done)
  end

  def set_tale
    @tale = Tale.find(params[:tale])
  end

  def set_line
    @line = @tale.lines.last
  end

  def invalid_new_line?
    @current_user.id != params[:id].to_i || !@tale.awaiting_new_line?
  end

  def invalid_line?
    @current_user.id != params[:id].to_i || !@tale.is_current_line_user?(@current_user)
  end

  def ready_to_close?
    params[:closed] && @current_user == @tale.owner
  end

end