class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :illustration

  validates :comment, presence: true
end
