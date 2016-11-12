class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :description, length: { minimum: 2, message: "is too short" }
  validates :rating, presence: true

end
