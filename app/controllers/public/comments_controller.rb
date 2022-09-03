# frozen_string_literal: true

class Public::CommentsController < ApplicationController
  before_action :ensure_login_user_comment, only: [:destroy]

  def create
    bucket_list = BucketList.find(params[:bucket_list_id])
    comment = current_user.comments.new(comment_params)
    comment.bucket_list_id = bucket_list.id
    comment.save
    # index,form用変数
    @bucket_list = BucketList.find(params[:bucket_list_id])
    @new_comment = Comment.new
  end

  def destroy
    Comment.find(params[:id]).destroy
    # index,form用変数
    @bucket_list = BucketList.find(params[:bucket_list_id])
    @new_comment = Comment.new
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end

    def ensure_login_user_comment
      bucket_list = BucketList.find(params[:id])
      if bucket_list.user_id != current_user.id
        flash[:notice] = "他のユーザーのコメントの削除はできません。"
        redirect_to user_path(current_user)
      end
    end
end
