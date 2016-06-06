class TaleDecorator < SimpleDelegator

  def formatted_status
    self.open ? "Open" : "Closed"
  end

end