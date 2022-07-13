class Public::RecordsController < ApplicationController

  def new
    @bg_id = params[:bg_id]
    @image = params[:image]
    @title = params[:title]
    @maxplayer = params[:maxplayer]
    @minplayer = params[:minplayer]
    @playingtime = params[:playingtime]
    
    @players = Player.where(user_id: current_user.id)
    # @new_played_boardgame = BoardGame.new
  end

  def create
    # # 未登録の場合、今回遊んだボドゲを保存。
    # if BoardGame.where(bg_id: params[:bg_id]).blank?
    #   @new_played_bg = BoardGame.new(boardgame_params)
    #   @new_played_bg.user_id = current_user.id
    #   @new_played_bg.save
    # else
    # end

    # # 今回の遊んだ記録を保存
    # @new_record = Record.new(record_params)
    # played_bg = BoardGame.where(bg_id: params[:bg_id]) # 受信した:bg_idは、上で保存するとともにここでid検索に利用。
    # @new_record.board_game_id = played_bg.id
    # @new_record.user_id = current_user.id
    # @new_record.save

    # # 今回のスコアを保存

  end

  def index
  end

  def show
  end

  private

  def boardgame_params
    params.require(:board_game).permit(:bg_id, :image, :title, :minplayer, :maxplayer, :playingtime)
  end

  def record_params
    params.require(:record).permit(:date, :playingtime, :memo)
  end

end
