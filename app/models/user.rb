class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :board_games, dependent: :destroy
  has_many :records, dependent: :destroy

end
