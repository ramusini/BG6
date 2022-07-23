class Public::BucketListsController < ApplicationController

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
    tag_list = params[:bucket_list][:name].split(',')
    @new_bucket_list.save
    @post.save_tag(tag_list)
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
    render :index
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
                                        :memo).merge(user_id: current_user.id)
  end

  def patch_bucket_list_params
    params.require(:bucket_list).permit(:memo)
  end

  # tag情報
  def article_params
    params.require(:article).permit(:body, tag_ids: [])
  end

end
