class User < ApplicationRecord
  has_many :lines
  has_many :tales, as: :owner
  has_many :tales, through: :lines

  has_secure_password
end
