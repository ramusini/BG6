# frozen_string_literal: true

class Public::SearchesController < ApplicationController
  def search
    if params[:word].present? # ボードゲームを検索
      bgg = BggApi.new
      res = bgg.search({ query: params[:word], type: "boardgame" })
      # resに格納されたハッシュのキー名が"item"の値を抜き出して配列化。
      # mapメソッドでキー名が『id』『value』の配列の値を抜き出し、新たに配列を作成。@resultsに格納。
      # 『value』でdigメソッドを利用しているのは、値がなかった場合でもエラーを吐かないようにするため。
      if res["total"] == "0"
      else
        # キー名『value』の中身で、キー名『name』の値は配列であるため、そこから0番の値のうち、キー名がvalueの値を取得。digなのは、値がない時用。
        @results = res["item"].map { |item| { id: item["id"], value: item.dig("name", 0, "value") } }
      end
      @search_word = params[:word]
      render template: "public/boardgames/index"
    else
      redirect_to "/"
    end
  end

  def index
    @bucket_lists = BucketList.all
    @bucket_list = BucketList.where(user_id: current_user.id)

    if params[:tag_ids] # タグ検索
      @bucket_lists = []
      params[:tag_ids].each do |key, value|
        @bucket_lists += Tag.find_by(name: key).bucket_lists if value == "1"
      end
      @tag_word = "1"
      @bucket_lists.uniq!
    elsif params[:prefecture] # 地域検索
      @prefecture_word = params[:prefecture]
      users = User.where(prefecture: params[:prefecture])
      user_ids = users.map { |user| user["id"] }
      @bucket_lists = BucketList.where(user_id: user_ids)
    elsif params[:bucket_title] # タイトル検索
      @bucket_title_word = params[:bucket_title]
      # looksメソッドにて、カラムのデータを大文字にして取得し、検索ワードを大文字に変換して検索。
      @bucket_lists = BucketList.looks(params[:bucket_title])
    end
  end

  def show
    # BGGのAPIからデータを取得する
    bgg = BggApi.new
    res = bgg.thing({ id: params[:bg_id] })
    @result = res["item"].map { |item| { id: item["id"],
                                      image: item["image"],
                                      title: item.dig("name", 0, "value"),
                                      minplayer: item.dig("minplayers", 0, "value"),
                                      maxplayer: item.dig("maxplayers", 0, "value"),
                                      playingtime: item.dig("playingtime", 0, "value") }}
  end
end
