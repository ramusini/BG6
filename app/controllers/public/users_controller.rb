class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.all
    @bucket_lists = BucketList.all
  end

  def show
    @user = User.find(params[:id])
    @played_bgs = @user.board_games
    @bucket_lists = @user.bucket_lists
    @tag_list = Tag.all
    # いいねリスト表示用
    favorites = Favorite.where(user_id: @user.id).pluck(:bucket_list_id)
    @favorite_bucket_lists = BucketList.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  # いいねした投稿を一覧表示
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:bucket_list_id)
    @favorite_bucket_lists = BucketList.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :memo)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
