class Player < ApplicationRecord
  belongs_to :user
  has_many :scores
  has_many :records, through: :scores
end
