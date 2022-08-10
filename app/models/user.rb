class User < ApplicationRecord
  has_many :items
  has_many :favorites, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
end
