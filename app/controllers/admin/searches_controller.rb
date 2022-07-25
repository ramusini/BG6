class Admin::SearchesController < ApplicationController

  def search
    if params[:address_num] == "1" #ユーザーを検索
      @users = User.looks(params[:word])
    elsif params[:address_num] == "2" # ユーザーのバゲットリストを検索
      @bucket_lists = BucketList.looks(params[:word])
    end
    render :index
  end

  def index
    
  end

end
