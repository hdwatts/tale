class Tale < ApplicationRecord
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :lines
  has_many :users, through: :lines
  has_many :tags_tales
  has_many :tags, through: :tags_tales

  accepts_nested_attributes_for :lines
  accepts_nested_attributes_for :tags

  def is_current_line_user?(user)
    return self.lines.last.user == user && !self.lines.last.done?
  end

  def awaiting_new_line?
    return self.lines.last.done?
  end
end
