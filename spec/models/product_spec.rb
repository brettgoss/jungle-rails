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
    end

    # FALSE CHECKS
    it 'should be false with no name' do
      @category = Category.new
      @product = Product.new({
        price: 20,
        quantity: 2,
        category: @category
      })
      expect(@product.save).to be false
    end

    it 'should be false with no price' do
      @category = Category.new
      @product = Product.new({
        name: 'banana',
        quantity: 2,
        category: @category
      })
      expect(@product.save).to be false
    end

    it 'should be false with no quantity' do
      @category = Category.new
      @product = Product.new({
        name: 'Banana',
        price: 2,
        category: @category
      })
      expect(@product.save).to be false
    end

    it 'should be false with no category' do
      @product = Product.new({
        name: 'Banana',
        price: 20,
        quantity: 2,
      })
      expect(@product.save).to be false
    end
  end
end


