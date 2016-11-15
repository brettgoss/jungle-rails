require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    # TRUE CHECKS
    it 'should be true with all params' do
      @category = Category.new
      @product = Product.new({
        name: 'Banana',
        price: 20,
        quantity: 2,
        category: @category
      })
      expect(@product.save).to be true
      expect(@product.errors.full_messages.empty?).to be true
    end

    # FALSE CHECKS
    it 'should be false with no params' do
      @product = Product.new
      expect(@product.save).to be false
      expect(@product.errors.full_messages.empty?).to be false
    end

    it 'should be false with no name' do
      @category = Category.new
      @product = Product.new({
        price: 20,
        quantity: 2,
        category: @category
      })
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'should be false with no price' do
      @category = Category.new
      @product = Product.new({
        name: 'banana',
        quantity: 2,
        category: @category
      })
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'should be false with no quantity' do
      @category = Category.new
      @product = Product.new({
        name: 'Banana',
        price: 2,
        category: @category
      })
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'should be false with no category' do
      @product = Product.new({
        name: 'Banana',
        price: 20,
        quantity: 2,
      })
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end


