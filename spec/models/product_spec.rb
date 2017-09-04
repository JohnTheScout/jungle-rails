require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be created when given proper data' do
      category = Category.new(name: 'Electronics')
      product = category.products.new(name: 'plumbus', price: 120, quantity: 4)
      expect(product.save).to be true
    end
    it 'should have a name' do
      category = Category.new(name: 'Electronics')
      product = category.products.new(name: nil, price: 12, quantity: 4)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'should have a price' do
      category = Category.new(name: 'Electronics')
      product = category.products.new(name: 'Plumbus', price: nil, quantity: 4)
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'should have a quantity' do
      category = Category.new(name: 'Electronics')
      product = category.products.new(name: 'Plumbus', price: 120, quantity: nil)
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should have a Category' do
      product = Product.new(name: 'Plumbus', price: 120, quantity: 4)
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
