# frozen_string_literal: true

class BucketListTagRelation < ApplicationRecord
  belongs_to :bucket_list
  belongs_to :tag
end
