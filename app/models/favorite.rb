# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :bucket_list
  belongs_to :user
end
