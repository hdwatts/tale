class Tale < ApplicationRecord
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_many :lines
  has_many :users, through: :lines
end
