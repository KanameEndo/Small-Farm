class User < ApplicationRecord
  has_many :foods
  has_many :favorites, dependent: :destroy
  has_many :favorite_foods, through: :favorites, source: :food #ⅲ

  def favorited_by?(food_id)
    favorites.where(food_id: food_id).exists?
  end

  # 以下を追加
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  validates :name, presence: true #追記

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
end
