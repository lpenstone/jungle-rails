require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "ensures a valid product name is validated" do
      @product = Product.new(name: nil, category: @category, price: 10, quantity: 10)
      assert !@product.valid?
      @product.name = 'Test'
      assert @product.valid?
    end

    it "ensures a valid product category is validated" do
      @product = Product.new(name: 'Test', category: nil, price: 10, quantity: 10)
      assert !@product.valid?
      @product.category = @category
      assert @product.valid?
    end

    it "ensures a valid product price is validated" do
      @product = Product.new(name: 'Test', category: @category, price: nil, quantity: 10)
      assert !@product.valid?
      @product.price = 10
      assert @product.valid?
    end

    it "ensures a valid product name is validated" do
      @product = Product.new(name: 'Test', category: @category, price: 10, quantity: nil)
      assert !@product.valid?
      @product.quantity = 10
      assert @product.valid?
    end

    it "ensures a product will save if input correctly" do
      @product = Product.new(name: 'Test', category: @category, price: 10, quantity: 10)
      assert @product.valid?
    end

    it "ensures the correct validation messages" do
      @product = Product.new()
      assert !@product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank", "Price can't be blank", "Name can't be blank", "Category can't be blank")
    end
  end

  before :each do
    @category = Category.new(name: "Test")
  end

end
