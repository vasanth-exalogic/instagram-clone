class HomeController < ApplicationController
  before_action :authenticate_user!


  def index
    @posts = Post.all.order("updated_at DESC")
  end

  def temp
    sign_out(current_user)
    redirect_to '/'
  end

  def show
    @user = User.find_by(username: params[:id])
    @posts = Post.select("id").where(user_id: @user.id).order("updated_at DESC")
    @temp = Follower.select('id').where(following: @user.id, user_id: current_user.id)
    @followers = Follower.select('id').where(following: @user.id)
    @following = Follower.select('id').where(user_id: @user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to profile_path(@user.username)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:id,:name,:username,:bio,:dp,:has_dp)
  end
end
