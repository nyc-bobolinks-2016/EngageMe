class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_secure_password

  has_many :presentations
  validates :username, :email, presence: true, uniqueness: true
  validates :password, length: { in: 5..12 }

end
