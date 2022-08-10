class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :user_id, presence: true
  validates :food_id, presence: true
  validates_uniqueness_of :food_id, scope: :user_id

  # def self.favorite_method(food, user)
  #   Favorite.find_by(food_id: food.id, user_id: user.id)
  # end
  # validates_uniqueness_of :food_id, scope: :user_id
end
