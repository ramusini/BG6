# frozen_string_literal: true

class Public::PlayersController < ApplicationController
  def index
    @players = Player.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @new_player = Player.new
  end

  def create
    @new_player = Player.new(player_params)
    if @new_player.save
      @players = Player.where(user_id: current_user.id)
      render :index
    else
      @new_player = Player.new
      flash[:notice] = "12文字以内で名前を入力してください"
      render :new
    end
  end

  def destroy
    players = Player.find(params[:id])
    players.destroy
    @players = Player.where(user_id: current_user.id)
    render :index
  end

  private
    def player_params
      params.require(:player).permit(:player_name).merge(user_id: current_user.id)
    end
end
