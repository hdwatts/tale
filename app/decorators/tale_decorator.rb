class TaleDecorator < SimpleDelegator

  def formatted_status
    open ? "Open" : "Closed"
  end
end