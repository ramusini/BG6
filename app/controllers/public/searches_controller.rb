class Public::SearchesController < ApplicationController

  def search
    if params[:address_num] == "1" #ボードゲームを検索
      bgg = BggApi.new
      res = bgg.search( {:query => params[:word], :type => 'boardgame'} )
      # resに格納されたハッシュのキー名が"item"の値を抜き出して配列化。
      # mapメソッドでキー名が『id』『value』の配列の値を抜き出し、新たに配列を作成。@resultsに格納。
      # 『value』でdigメソッドを利用しているのは、値がなかった場合でもエラーを吐かないようにするため。
      @results = res["item"].map{|item| {id: item["id"], value: item.dig("name", 0, "value")}} # ←キー名『name』の値が配列になっているので、そこから0番の値のうち、キー名がvalueのものを抜いている
      render template: "public/boardgames/index"
    elsif params[:address_num] == "2" # ユーザーを検索
      @users = User.looks(params[:word])
      render template: "public/users/index"
    elsif params[:address_num] == "3" # ユーザーのバゲットリストを検索
      @bucket_lists = BucketList.looks(params[:word])
      render template: "public/bucket_lists/index"
    end
  end

  def index
    @users = User.all
    @bucket_lists = BucketList.all

    if params[:tag_ids]
      @bucket_lists = []
      params[:tag_ids].each do |key, value|
        @bucket_lists += Tag.find_by(name: key).bucket_lists if value == "1"
      end
      @bucket_lists.uniq!
    end
  end

  def show
    # BGGのAPIからデータを取得する
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
