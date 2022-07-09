class Public::SearchesController < ApplicationController

  def search
    bgg = BggApi.new
    if params[:bg_id].blank?
      res = bgg.search( {:query => params[:bg_title], :type => 'boardgame'} )
      # resにあるハッシュのキー名が"item"のものを配列化する。mapでそこから、"id""value"がキー名の配列が入った配列を作成し、@resultsに格納
      @results = res["item"].map{|item| {id: item["id"], value: item.dig("name", 0, "value")}} #←キー名がnameの値が配列になっているので、そこから0番の値のうち、キー名がvalueのものを抜いている
    else
      res = bgg.thing({:id => params[:bg_id]})
      @results = res
    end
  end

end
