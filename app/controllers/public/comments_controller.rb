class Public::CommentsController < ApplicationController

  def create
    bucket_list = BucketList.find(params[:bucket_list_id])
    comment = current_user.comments.new(comment_params)
    comment.bucket_list_id = bucket_list.id
    comment.save
    #index,form用変数
    @bucket_list = BucketList.find(params[:bucket_list_id])
    @new_comment = Comment.new
  end

  def destroy
    Comment.find(params[:id]).destroy
    #index,form用変数
    @bucket_list = BucketList.find(params[:bucket_list_id])
    @new_comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
