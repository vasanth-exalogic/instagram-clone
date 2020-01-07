class LikesController < ApplicationController

  def new
    current_user.likes.create(post_id: params[:id])
    redirect_to post_path(params[:id])
  end

  def destroy
    Like.find_by(post_id: params[:id], user_id: current_user.id).delete
    redirect_to post_path(params[:id])
  end
end
