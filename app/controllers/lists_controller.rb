class ListsController < ApplicationController

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.post_id = params[:id]
    if @list.save
      redirect_to post_path(params[:id])
    end
  end

  private

  def list_params
    params.require(:list).permit(:user_id,:post_id,:comment)
  end
  
end
