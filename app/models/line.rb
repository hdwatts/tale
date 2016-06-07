class Line < ApplicationRecord
  belongs_to :user
  belongs_to :tale, inverse_of: :lines

  validates :content, length: { maximum: 250}
  validate :done_without_content

  def display_line
    "<p> #{content} </p>
    (<b>Written By:</b> #{user.html_link_to_user})".html_safe
  end

  def done_without_content
    errors.add(:content, "cannot be empty") if done && no_content
  end

  def no_content
    !content || content.strip == ""
  end
end
