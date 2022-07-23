class Tag < ApplicationRecord
  has_many :bucket_list_tag_relations, dependent: :destroy
  has_many :bucket_lists, through: :bucket_list_tag_relations, dependent: :destroy
end
