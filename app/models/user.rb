class User < ApplicationRecord
  has_many :lines
  has_many :tales, as: :owner
  has_many :tales, through: :lines

  has_secure_password
  validates_presence_of :first_name, :last_name, :username, :email
  validates_uniqueness_of :username, :email
  validate :valid_email
  validate :minimum_six_character_password

  def valid_email
    errors.add(:email, "is not a valid email") if email !~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  def minimum_six_character_password
    errors.add(:password, "must be at least 6 characters") if password && password.length < 6
  end

  def tales_owned
    tales.where(owner_id: id).reverse
  end

  def tales_contributed
    tales - tales_owned
  end

  def html_link_to_user
    "<a href='/users/#{id}''>#{username}</a>".html_safe
  end

end
