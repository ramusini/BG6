# frozen_string_literal: true

class Public::BucketListsController < ApplicationController
  before_action :ensure_login_user, only: [:edit, :update]
  before_action :ensure_login_user_bucket_list, only: [:destroy]

  def new
    @new_bucket_list = BucketList.new

    @bg_id = params[:bg_id]
    @image = params[:image]
    @title = params[:title]
    @maxplayer = params[:maxplayer]
    @minplayer = params[:minplayer]
    @playingtime = params[:playingtime]
  end

  def create
    @new_bucket_list = BucketList.new(bucket_list_params)
    @new_bucket_list.save
    # 繰り返し、選択したタグを保存
    params[:bucket_list][:tag_ids].each do |tag|
      new = BucketListTagRelation.new
      new.tag_id = tag
      new.bucket_list_id = @new_bucket_list.id
      new.save
    end
    redirect_to user_path(current_user)
  end

  def index
    @bucket_lists = BucketList.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    favorites = Favorite.where(user_id: @user.id).pluck(:bucket_list_id)
    @favorite_bucket_lists = BucketList.find(favorites)
  end

  def show
    @bucket_list = BucketList.find(params[:id])
    @new_comment = Comment.new
  end

  def destroy
    bucket_list = BucketList.find(params[:id])
    bucket_list.destroy
    @bucket_lists = BucketList.where(user_id: current_user.id)
    redirect_to user_path(current_user)
  end

  def edit
    @bucket_list = BucketList.find(params[:id])
  end

  def update
    @bucket_list = BucketList.find(params[:id])
    if @bucket_list.update(patch_bucket_list_params)
      redirect_to bucket_lists_path
    else
      render "edit"
    end
  end


  private
    def bucket_list_params
      params.require(:bucket_list).permit(:bg_id,
                                          :image,
                                          :bucket_title,
                                          :minplayer,
                                          :maxplayer,
                                          :playingtime,
                                          :memo
                                         ).merge(user_id: current_user.id)
    end

    def patch_bucket_list_params
      params.require(:bucket_list).permit(:memo)
    end

    def ensure_login_user
      user = User.find(params[:id])
      if user.id != current_user.id
        flash[:notice] = "他のユーザーの編集はできません。"
        redirect_to user_path(current_user)
      end
    end

    def ensure_login_user_bucket_list
      bucket_list = BucketList.find(params[:id])
      if bucket_list.user_id != current_user.id
        flash[:notice] = "他のユーザーの投稿の削除はできません。"
        redirect_to user_path(current_user)
      end
    end

end
