module Concerns
  module Following
    extend ActiveSupport::Concern

    included do
      # 用户对于关注者，一对多关系
      has_many :following_relationships, foreign_key: :follower_id
      # select * from users where id in (?) #follower_ids
      has_many :followed_users, through: :following_relationships

      has_many :follower_relationships,
        foreign_key: :followed_user_id,
        class_name: 'FollowingRelationship'
      has_many :followers, through: :follower_relationships
    end

    def following? user
      followed_user_ids.include? user.id
    end

    def can_follow? user
      self != user
    end

    def follow user
      followed_users << user
    end

    def unfollow user
      followed_users.delete(user)
    end

  end
end
