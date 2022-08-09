class User < ApplicationRecord
  has_many :favorites, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
