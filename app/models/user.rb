class User < ApplicationRecord
  has_many :foods
  has_many :favorites, dependent: :destroy
  has_many :favorite_foods, through: :favorites, source: :food #ⅲ

  def favorited_by?(food_id)
    favorites.where(food_id: food_id).exists?
  end

  validates :name, presence: true #追記

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
end
