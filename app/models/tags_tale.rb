class TagsTale < ApplicationRecord
  belongs_to :tag
  belongs_to :tale
end