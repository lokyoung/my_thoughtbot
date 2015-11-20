class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :shouts
end
