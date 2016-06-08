class Line < ApplicationRecord
  belongs_to :user
  belongs_to :tale, inverse_of: :lines

  validate :too_many_characters
  validate :done_without_content

  def display_line
    "<div class='line' data-line-id='#{id}'><div class='entry'><h3>#{content}</h3></div>
    <div class='author'><h5><small>by</small> #{user.html_link_to_user}</h5></div></div>".html_safe
  end

  def too_many_characters
    content && content.gsub(/<br>/, "").length > 250
  end

  def done_without_content
    errors.add(:content, "cannot be empty") if done && ( no_content || too_many_characters )
  end

  def no_content
    !content || content.strip == ""
  end
end
