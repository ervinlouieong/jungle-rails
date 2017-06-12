require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should be valid if name, price, quantity, category are present' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create!(
        name: 'a',
        price: 1,
        quantity: 1,
        category: cat1)
      expect(p).to be_valid
    end
    
    it 'should include error message if name is nil' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create(
        name: nil,
        price: 1,
        quantity: 1,
        category: cat1)
      expect(p.errors.full_messages).to include("Name can't be blank") 
    end

    it 'should include error message if price is nil' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create(
        name: 'a',
        price: nil,
        quantity: 1,
        category: cat1)
      expect(p.errors.full_messages).to include("Price can't be blank")
    end 

    it 'should include error message if quanity is nil' do
      cat1 = Category.create! name: 'Apparel'
      p = Product.create(
        name: 'a',
        price: 1,
        quantity: nil,
        category: cat1)
      expect(p.errors.full_messages).to include("Quantity can't be blank") 
    end

    it 'should include error message if category is nil' do
      p = Product.create(
        name: 'a',
        price: 1,
        quantity: 1,
        category: nil)
      expect(p.errors.full_messages).to include("Category can't be blank") 
    end

  end
end