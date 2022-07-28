class Public::BoardgamesController < ApplicationController

  def index
    @played_bgs = BoardGame.where(user_id: current_user.id)
  end

  def show
    @played_bg = BoardGame.find(params[:id])
    @records = Record.where(board_game_id: @played_bg.bg_id, user_id: current_user.id)
  end

  def create
    # 遊んだボドゲが未登録の場合保存
    if BoardGame.where(bg_id: params[:bg_id], user_id: current_user.id).blank?
      @new_played_bg = BoardGame.new(boardgame_params)
      @new_played_bg.save
    else
    end
    redirect_to new_record_path(bg_id: params[:bg_id])
  end

  def edit
  end

  def delete
  end

  private

  def boardgame_params
    params.permit(:bg_id,
                  :image,
                  :played_title,
                  :minplayer,
                  :maxplayer,
                  :playingtime
                  ).merge(user_id: current_user.id)
  end

end
