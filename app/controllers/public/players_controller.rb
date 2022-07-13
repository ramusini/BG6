class Public::PlayersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @new_player = Player.new
  end

  def create
    @new_player = Player.new(player_params)
    @new_player.user_id = current_user.id
    @new_player.save
    redirect_to new_record_path
  end

  private

  def player_params
    params.require(:player).permit(:player_name)
  end

end
