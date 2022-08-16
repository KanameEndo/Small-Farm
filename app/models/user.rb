class User < ApplicationRecord
  has_many :foods
  has_many :favorites, dependent: :destroy
  has_many :favorite_foods, through: :favorites, source: :food
  has_many :plans

  def favorited_by?(food_id)
    favorites.where(food_id: food_id).exists?
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  def self.admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "管理者ゲストユーザー"
      user.admin = true
    end
  end

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
end
