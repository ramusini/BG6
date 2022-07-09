class Public::BoardgamesController < ApplicationController

  def index
    @playd_bgs = BoardGame.where(user_id: current_user.id)
  end

  def show
    @playd_bg = BoardGame.find(1)
  end

  def create
  end

  def edit
  end

  def delete
  end

end
