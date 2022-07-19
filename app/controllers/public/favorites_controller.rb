class Public::FavoritesController < ApplicationController
  def create
    @bucket_list = BucketList.find(params[:bucket_list_id])
    @bucket_list_favorite = Favorite.new(user_id: current_user.id, bucket_list_id: params[:bucket_list_id])
    @bucket_list_favorite.save
  end

  def destroy
    @bucket_list = BucketList.find(params[:bucket_list_id])
    #find_byはid(主キー)か不明で、別の条件でレコードを検索したい場合
    @bucket_list_favorite = Favorite.find_by(user_id: current_user.id, bucket_list_id: params[:bucket_list_id])
    @bucket_list_favorite.destroy
  end
end
