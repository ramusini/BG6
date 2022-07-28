class Admin::UsersController < ApplicationController
  before_action :require_permission

  def show
    @user = User.find(params[:id])
    @played_bgs = @user.board_games
    @bucket_lists = @user.bucket_lists
    @tag_list = Tag.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(is_deleted_params)
    redirect_to admin_user_path(@user)
  end

  def destroy
    bucket_list = BucketList.find(params[:id])
    bucket_list.destroy
    if params[:user].blank?
      redirect_to search_admin_searches_path(params[:word])
    else
      redirect_to admin_user_path(params[:user])
    end
  end

  def require_permission
    if admin_signed_in?
    else
      redirect_to new_admin_session_path
    end
  end

  private

  def is_deleted_params
    params.permit(:is_deleted)
  end
end
