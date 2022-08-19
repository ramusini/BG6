class Admin::TagsController < ApplicationController
  def new
    @new_tag = Tag.new
    @tags = Tag.all
  end

  def create
    @new_tag = Tag.new(params_tag)
    @new_tag.save
    @tags = Tag.all
    redirect_to new_admin_tag_path
  end

  def destroy
    tag = Tag.find(params[:id])
    active_tag = BucketListTagRelation.where(tag_id: params[:id])
    # タグが利用中の場合削除できないように分岐
    if active_tag.blank?
      tag.destroy
    else
      flash[:tag_destroy_faild] = "利用中のタグは削除不可"
    end
    @tags = Tag.all
    redirect_to new_admin_tag_path
  end

  private
    def params_tag
      params.permit(:name)
    end
end
