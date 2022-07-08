class Public::SearchesController < ApplicationController
  require 'bgg-api'

  def search
    bgg = BggApi.new
    @results = bgg.search( {:query => params[:bg_title], :type => 'boardgame'} )
  end

end
