class Public::PlayersController < ApplicationController

  def index
    @players = Player.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @new_player = Player.new
    @link_from = params[:link_from]
  end

  def create
    @new_player = Player.new(player_params)
    @new_player.save
    @players = Player.where(user_id: current_user.id)
    render :index
  end

  private

  def player_params
    params.require(:player).permit(:player_name).merge(user_id: current_user.id)
  end

end
