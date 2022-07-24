class Tag < ApplicationRecord
  has_many :bucket_list_tag_relations, dependent: :destroy, foreign_key: 'tag_id'
  has_many :bucket_lists, through: :bucket_list_tag_relations, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
