class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bucket_list

  validates :comment, presence:true, length: { maximum: 400 }
end
