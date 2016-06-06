class UserDecorator < SimpleDelegator

  def full_name
    first_name.titleize + " " + last_name.titleize
  end

  def formatted_join_date
    created_at.strftime("%b %d, %Y")
  end

end