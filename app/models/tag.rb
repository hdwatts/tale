class Tag < ApplicationRecord
  has_many :tags_tales
  has_many :tales, through: :tags_tales
end
