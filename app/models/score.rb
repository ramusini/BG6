# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :record
  belongs_to :player

  validates :score, numericality: {only_integer: true}
  
end
