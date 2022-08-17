# frozen_string_literal: true

class BucketList < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bucket_list_tag_relations, dependent: :destroy
  has_many :tags, through: :bucket_list_tag_relations, dependent: :destroy

  # 一致するレコードが存在しない＝「まだいいねしていない→createアクションへ」
  # 一致するレコードが存在する　＝「すでにいいね済み→destroyアクションへ」
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索
  def self.looks(word)
    if word.blank?
      BucketList.all
    else
      BucketList.where("bucket_title LIKE?", "%#{word}%")
    end
  end

  # def save_tag(sent_tags)
  #   sent_tags.each do |new|
  #     new_bucket_list_tag = Tag.find_or_create_by(name: new)
  #     self.tags << new_bucket_list_tag
  #   end
  # end

  accepts_nested_attributes_for :bucket_list_tag_relations
end
