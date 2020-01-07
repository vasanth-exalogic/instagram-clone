class FollowersController < ApplicationController

  def new
    @user = User.find(params[:id])
    current_user.followers.create(following: @user.id)
    redirect_to profile_path(@user.username)
  end

  def destroy
    @follower = Follower.find(params[:id])
    temp = User.find(@follower.following)
    @follower.delete
    redirect_to profile_path(temp.username)
  end
end
