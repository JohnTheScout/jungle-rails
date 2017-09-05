class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :deduct_cart

  private
  def deduct_cart
    self.line_items.each do |item|
      prod = Product.find(item.product_id)
      prod.quantity -= item.quantity
      prod.save
    end
  end

end
