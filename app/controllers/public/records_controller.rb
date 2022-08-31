# frozen_string_literal: true

class Public::RecordsController < ApplicationController
  def new
    # 一括保存。親モデル:Record。子モデル:score
    @new_record = Record.new
    @new_record.scores.build
    # BoardGameに保存する情報
    @bg_data = BoardGame.where(bg_id: params[:bg_id])
    # 登録済みプレイヤーリスト
    @players = Player.where(user_id: current_user.id)
  end

  def create
    # 今回の遊んだ記録を保存
    @new_record = Record.new(record_params)
    @bg_id = @new_record[:board_game_id]
    if @new_record.save
      redirect_to user_path(current_user)
    else
      @new_record = Record.new
      @new_record.scores.build
      @bg_data = BoardGame.where(bg_id: @bg_id)
      @players = Player.where(user_id: current_user.id)
      flash[:notice] = "スコアに数字を入力してください"
      render :new
    end
  end

  def index
  end

  def show
  end

  private
    def record_params
      params.require(:record).permit(:date,
                                    :playing_time,
                                    :memo,
                                    :board_game_id,
                                    scores_attributes: [:id, :record_id, :player_id, :score, :_destroy] # cocoon用
      ).merge(user_id: current_user.id)
    end
end
