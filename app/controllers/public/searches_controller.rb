class Public::SearchesController < ApplicationController

  def index
    bgg = BggApi.new
    # トップ画面でユーザーが入力した検索ワードを『:bg_title』として受け受けてsearch。resに格納。
    res = bgg.search( {:query => params[:bg_title], :type => 'boardgame'} )
    # resに格納されたハッシュのキー名が"item"のものを抜き出して配列化。
    # mapメソッドでキー名が『id』『value』の配列の値を抜き出し、新たに配列を作成。@resultsに格納。
    # 『value』でdigメソッドを利用しているのは、値がなかった場合でもエラーを吐かないようにするため。
    @results = res["item"].map{|item| {id: item["id"], value: item.dig("name", 0, "value")}} # ←キー名『name』の値が配列になっているので、そこから0番の値のうち、キー名がvalueのものを抜いている
  end

  def show
    bgg = BggApi.new
    res = bgg.thing({:id => params[:bg_id]})
    @result = res["item"].map{|item| {id: item["id"],
                                      image: item["image"],
                                      title: item.dig("name", 0, "value"),
                                      minplayer: item.dig("minplayers", 0, "value"),
                                      maxplayer: item.dig("maxplayers", 0, "value"),
                                      playingtime: item.dig("playingtime", 0, "value")}}
  end

end
