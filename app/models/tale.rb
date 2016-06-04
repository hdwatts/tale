class Tale < ApplicationRecord
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :lines
  has_many :users, through: :lines
  has_many :tags_tales
  has_many :tags, through: :tags_tales

  accepts_nested_attributes_for :lines
  accepts_nested_attributes_for :tags
end
