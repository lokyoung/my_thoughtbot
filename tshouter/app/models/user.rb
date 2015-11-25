class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  # select * from shouts where user_id = ?
  has_many :shouts
  # 用户对于关注者，一对多关系
  # select * from following_relationships where follower_id = ?
  has_many :following_relationships, foreign_key: :follower_id
  # select * from users where id in (?) #follower_ids
  has_many :followed_users, through: :following_relationships

  has_many :follower_relationships,
            foreign_key: :followed_user_id,
            class_name: 'FollowingRelationship'
  has_many :followers, through: :follower_relationships

  def following? user
    followed_user_ids.include? user.id
  end

  def follow user
    followed_users << user
  end

  def unfollow user
    followed_users.delete(user)
  end
end
