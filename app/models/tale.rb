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
  validates :prompt, length: { maximum: 250}

  def display_last_line
    string = String.new
    index = -1
    sorted_lines = lines.sort {|a,b| a.id <=> b.id}
    until string.length >= 250 || !sorted_lines[index] do
      string = sorted_lines[index].content + string if sorted_lines[index].done?
      index -= 1
    end
    lines_to_spaces(string)
  end

  def lines_to_spaces(string)
    string.gsub(/\<br\>/, " ").html_safe
  end

  def owner_name
    owner.username
  end

  def is_current_line_user?(user)
    lines.last.user == user && !awaiting_new_line?
  end

  def awaiting_new_line?
    lines.last.done?
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
