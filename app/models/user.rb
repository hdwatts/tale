class User < ApplicationRecord
  has_many :lines
  has_many :tales, as: :owner
  has_many :tales, through: :lines

  has_secure_password
  validates_presence_of :first_name, :last_name, :username, :email
  validates_uniqueness_of :username, :email
  # validate :valid_email

  # def valid_email
  #   errors.add(:email, "is invalid") unless 
  # end
end
