# frozen_string_literal: true

class BoardGame < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
end
