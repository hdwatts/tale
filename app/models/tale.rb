class Tale < ApplicationRecord
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :lines, inverse_of: :tale, dependent: :destroy
  has_many :users, through: :lines
  has_many :tags_tales, dependent: :destroy
  has_many :tags, through: :tags_tales
  accepts_nested_attributes_for :lines
  accepts_nested_attributes_for :tags

  validates_presence_of :title
  validates :title, length: { maximum: 65}


  def display_last_line
    str = ""
    index = 0
    while str.length < 250 && !self.lines[self.lines.length - index - 1].nil? do
      line = self.lines[self.lines.length - index - 1]
      if line.done?
        str = " #{line.content} #{str}"
      end

      index += 1
    end

    str.gsub(/\<br\>/, " ").html_safe
  end

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
