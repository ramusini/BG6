# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :user
  has_many :scores
  has_many :records, through: :scores

  validates :player_name, length: { maximum: 12 }, presence: true
end
