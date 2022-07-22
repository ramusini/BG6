class BucketList < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  #一致するレコードが存在しない＝「まだいいねしていない→createアクションへ」
  #一致するレコードが存在する　＝「すでにいいね済み→destroyアクションへ」
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end

  # 検索
  def self.looks(word)
    if word.blank?
      BucketList.all
    else
      BucketList.where("bucket_title LIKE?","%#{word}%")
    end
  end
end
