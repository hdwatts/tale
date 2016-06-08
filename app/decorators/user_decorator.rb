class UserDecorator < SimpleDelegator

  def formatted_join_date
    created_at.strftime("%b %d, %Y")
  end

  def full_name
    first_name.titleize + " " + last_name.titleize
  end
end