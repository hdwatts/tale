class Line < ApplicationRecord
  belongs_to :user
  belongs_to :tale

  validates :content, length: { maximum: 250}
end
