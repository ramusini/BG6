class Record < ApplicationRecord
  belongs_to :user
  belongs_to :boar_dgame
  has_many :scores
  has_many :players, through: :scores
end
