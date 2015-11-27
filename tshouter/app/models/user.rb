class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  # select * from shouts where user_id = ?
  has_many :shouts
  include Concerns::Following
end
