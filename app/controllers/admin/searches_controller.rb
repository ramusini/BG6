class Admin::SearchesController < ApplicationController
  before_action :require_permission

  def search
    if params[:address_num] == "1" #ユーザーを検索
      @users = User.looks(params[:word])
    elsif params[:address_num] == "2" # ユーザーのバゲットリストを検索
      @bucket_lists = BucketList.looks(params[:word])
    end
    render :index
  end

  def require_permission
    admin_signed_in?
    redirect_to new_admin_session_path
  end

end
