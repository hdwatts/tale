class UserDecorator < SimpleDelegator

  def formatted_join_date
    created_at.strftime("%b %Y")
  end

  def full_name
    first_name.titleize + " " + last_name.titleize
  end

  def has_contributions
    tales_contributed.count > 0 || tales_owned.count > 0
  end

  def owned_count
    tales_owned.count
  end

  def my_profile(current_user)
   current_user && current_user.id  == self.id
  end
end