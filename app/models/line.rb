class Line < ApplicationRecord
  belongs_to :user
  belongs_to :tale

  validates :content, length: { minimum: 10, maximum: 250}
end
