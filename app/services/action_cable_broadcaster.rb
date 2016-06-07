class ActionCableBroadcaster

  attr_reader :line
  attr_reader :tale
  attr_reader :content

  def initialize(line, content=nil)
    @line = line
    @tale = line.tale
    @content = content

  end

  def create_line_broadcast
    ActionCable.server.broadcast 'lines',
      content: line.content,
      user_id: line.user.id,
      tale_id: tale.id,
      hide: true,
      owner_id: tale.owner.id
  end

  def update_line_broadcast
    ActionCable.server.broadcast 'lines',
      content: line.content,
      user_id: line.user.id,
      tale_id: tale.id,
      display_line: line.display_line,
      done: line.done,
      tale_open: tale.open
  end

  def show_line_broadcast
    ActionCable.server.broadcast 'lines',
      content: content,
      user_id: line.user.id,
      tale_id: tale.id
  end

end