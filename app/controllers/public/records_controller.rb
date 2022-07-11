class Public::RecordsController < ApplicationController

  def new
    @new_record = Record.new
    @new_played_boardgame = BoardGame.new
  end

  def index
  end

  def show
  end

end
