class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :board_games, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :bucket_lists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :profile_image

  # プロフィール画像
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-mage.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # 検索
  def self.looks(word)
    if word.blank?
      User.all
    else
      User.where("name LIKE?","%#{word}%")
    end
  end

  # ゲストユーザー
  def self.guest
    find_or_create_by!(name: 'guestuser' ,
                      email: 'guests@example.com',
                      postal_code: '1231234',
                      prefecture: 'ボドゲ県',
                      city: 'ミープル区',
                      age: '0〜99',
                      memo: '主に重ゲーを遊んでいます！') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  validates :postal_code, presence: true
  validates :name, uniqueness: true, length: { maximum: 12 }
  validates :city, presence: true
  validates :age, presence: true
end
