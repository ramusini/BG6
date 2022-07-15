class Public::BoardgamesController < ApplicationController

  def index
    @playd_bgs = BoardGame.where(user_id: current_user.id)
  end

  def show
    @playd_bg = BoardGame.find(1)
  end
  
  def new
    @bg_id = params[:bg_id]
    @image = params[:image]
    @title = params[:title]
    @maxplayer = params[:maxplayer]
    @minplayer = params[:minplayer]
    @playingtime = params[:playingtime]
  end

  def create
    # 未登録の場合、今回遊んだボドゲを保存。
    if BoardGame.where(bg_id: params[:bg_id]).blank?
      @new_played_bg = BoardGame.new(boardgame_params)
      @new_played_bg.user_id = current_user.id
      @new_played_bg.save
    else
    end
  end

  def edit
  end

  def delete
  end

end
