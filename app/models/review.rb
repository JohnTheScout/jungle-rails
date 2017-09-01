class Review < ActiveRecord::Base
  belongs_to :product

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
