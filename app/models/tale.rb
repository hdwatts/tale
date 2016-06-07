class Tale < ApplicationRecord
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :lines, inverse_of: :tale, dependent: :destroy
  has_many :users, through: :lines
  has_many :tags_tales, dependent: :destroy
  has_many :tags, through: :tags_tales
  accepts_nested_attributes_for :lines
  accepts_nested_attributes_for :tags



  def is_current_line_user?(user)
    self.lines.last.user == user && !awaiting_new_line?
  end

  def awaiting_new_line?
    self.lines.last.done?
  end

  def close
    update(open: false)
  end

  def self.open_tales
    where(open: true)
  end

  def self.closed_tales
    where(open: false)
  end

end
