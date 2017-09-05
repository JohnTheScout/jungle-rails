require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creating' do
    before :each do
      @cat = Category.create(name: 'Sci-fi')
      @prod1 = @cat.products.create!(name: 'Plumbus', price_cents: 120, quantity: 5)
      @prod2 = @cat.products.create!(name: 'Fleem', price_cents: 20, quantity: 25)
      @prod3 = @cat.products.create!(name: 'Portal Gun', price_cents: 1020, quantity: 2)
    end
    
    it 'deducts quantity from products based on their line item quantities' do
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(total_cents: 140, stripe_charge_id: '123456789', email: 'test@test.com')
      # 2. build line items on @order
      @order.line_items.new(
        product: @prod1,
        quantity: 1,
        item_price: @prod1.price_cents,
        total_price: @prod1.price_cents
      )
      @order.line_items.new(
        product: @prod2,
        quantity: 2,
        item_price: @prod2.price_cents,
        total_price: @prod2.price_cents * 2
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @prod1.reload
      @prod2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@prod1.quantity).to eql(4)
      expect(@prod2.quantity).to eql(23)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(total_cents: 140, stripe_charge_id: '123456789', email: 'test@test.com')
      # 2. build line items on @order
      @order.line_items.new(
        product: @prod1,
        quantity: 1,
        item_price: @prod1.price_cents,
        total_price: @prod1.price_cents
      )
      @order.line_items.new(
        product: @prod2,
        quantity: 2,
        item_price: @prod2.price_cents,
        total_price: @prod2.price_cents * 2
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @prod1.reload
      @prod2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@prod3.quantity).to eql(2)
    end
  end
end
