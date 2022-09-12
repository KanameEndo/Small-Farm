class Comment < ApplicationRecord
  belongs_to :plan
  validates :comment, presence: true
end
