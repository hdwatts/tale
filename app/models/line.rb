class Line < ApplicationRecord
  belongs_to :user
  belongs_to :tale, inverse_of: :lines

  validates :content, length: { maximum: 250}
  validate :done_without_content

  def display_line
    "<div class='entry'><h3>#{content}</h3></div>
    <div class='author'><h5><small>by</small> #{user.html_link_to_user}</h5></div>".html_safe
  end

  def done_without_content
    errors.add(:content, "cannot be empty") if done && no_content
  end

  def no_content
    !content || content.strip == ""
  end
end
