class User < ApplicationRecord
  has_many :favorites, dependent: :destroy

  # def favorited?(food)
  #   self.favorites.exists?(food_id: food.id)
  # end

  validates :name, presence: true #追記

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
end
