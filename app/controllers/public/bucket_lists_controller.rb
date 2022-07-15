class Public::BucketListsController < ApplicationController

  def new
    @bg_id = params[:bg_id]
    @image = params[:image]
    @title = params[:title]
    @maxplayer = params[:maxplayer]
    @minplayer = params[:minplayer]
    @playingtime = params[:playingtime]
  end

  def create
    @new_bucket_list = BucketList.new(bucket_list_params)
    @new_bucket_list.user_id = current_user.id
    @new_bucket_list.save

    @bucket_lists = BucketList.where(user_id: current_user.id)
    render :index
  end

  def index
    @bucket_lists = BucketList.where(user_id: current_user.id)
  end

  def show
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
    params.permit(:bg_id, :image, :bucket_title, :minplayer, :maxplayer, :playingtime, :memo)
  end

  def patch_bucket_list_params
    params.require(:bucket_list).permit(:memo)
  end

end
