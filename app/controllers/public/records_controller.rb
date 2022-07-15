class Public::RecordsController < ApplicationController

  def new
    @new_record = Record.new
    @new_score = @new_record.scores.build

    # BoardGameに保存する情報
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
    #   @new_played_bg.user_id = current_user.id #paramsでmergeメソッド使えばいけるか？.merge(user_id: current_user.id)を)の
    #   @new_played_bg.save
    # else
    # end

    # 今回の遊んだ記録を保存
    @new_record = Record.new(record_params)
    # played_bg = BoardGame.where(bg_id: params[:bg_id]) # 受信した:bg_idは、上で保存するとともにここでid検索に利用。
    # @new_record.board_game_id = played_bg.id #mergeでできるか確認。できたら削除
    if @new_record.save
      redirect_to records_path
    else
      render :new
    end

  end

  def index
  end

  def show
  end

  private

  def boardgame_params
    params.require(:board_game).permit(:bg_id,
                                      :image,
                                      :title,
                                      :minplayer,
                                      :maxplayer,
                                      :playingtime
                                      ).merge(user_id: current_user.id)
  end

  def record_params
    params.require(:record).permit(:date,
                                  :playingtime,
                                  :memo,
                                  scores_attributes: [:id, :record_id, :player_id, :score, :_destroy] # :idはなぜか必要らしい。削除して試そう。:_destroyは増やした列を削除するのに利用？
                                  ).merge(user_id: current_user.id, board_game_id: params[:bg_id])
  end

end
