class TaleCreator

  def self.create_tale(tale_params, current_user)
    @tale = Tale.new(tale_params)
    @tale.lines.first.user = current_user
    @tale.owner = current_user
    @tale
  end

end