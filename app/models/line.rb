class Line < ApplicationRecord
  belongs_to :user
  belongs_to :tale, inverse_of: :lines

  validates :content, length: { minimum: 10, maximum: 250}
end
