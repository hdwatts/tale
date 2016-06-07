class Line < ApplicationRecord
  belongs_to :user
  belongs_to :tale, inverse_of: :lines

  validates :content, length: { maximum: 250}
  validate :done_without_content

  def done_without_content
    errors.add(:content, "cannot be empty") if done && no_content
  end

  def no_content
    !content || content.strip == ""
  end
end
