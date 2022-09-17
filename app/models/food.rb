class Food < ApplicationRecord
  belongs_to :user, optional: true

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :item_name,  presence: true, length: { maximum: 255 }
  validates :comment,  presence: true, length: { maximum: 255 }
  validates :harvest,  presence: true, length: { maximum: 255 }
  validates :price,  presence: true
end
