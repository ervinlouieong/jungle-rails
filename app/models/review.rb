class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, numericality: true
end
