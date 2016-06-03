class Tag < ApplicationRecord
  has_many :tags_tales
  has_many :tags, through: :tags_tales
end
