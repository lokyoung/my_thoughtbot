class FollowingRelationshipsController < ApplicationController
  def create
    current_user.follow user
    redirect_to user, notice: "Now following this user."
  end

  def destroy
    current_user.unfollow user
    redirect_to user, notice: "Not follow any more."
  end

  private
  
  def user
    @_user ||= User.find(params[:user_id])
  end
end
