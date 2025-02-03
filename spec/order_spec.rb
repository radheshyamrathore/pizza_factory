require 'rspec'
require_relative '../lib/order'
require_relative '../lib/pizza'
require 'simplecov'
require 'spec_helper'

RSpec.describe Order do
  let(:order) { Order.new }
  let(:pizza) { Pizza.new("Deluxe Veggie", "regular", "New hand tossed") }

  describe '#initialize' do
    it 'initializes with empty pizzas and sides' do
      expect(order.pizzas).to be_empty
      expect(order.sides).to be_empty
    end
  end

  describe '#add_pizza' do
    it 'adds a pizza to the order' do
      order.add_pizza(pizza)
      expect(order.pizzas).to include(pizza)
    end
  end

  describe '#add_side' do
    it 'adds a valid side item' do
      order.add_side("Cold drink")
      expect(order.sides).to include("Cold drink")
    end

    it 'rejects an invalid side item' do
      expect(order.add_side("Invalid Side")).to eq("Invalid side item")
    end
  end

  describe '#total_price' do
    it 'calculates total price correctly' do
      pizza.add_extra_cheese
      order.add_pizza(pizza)
      order.add_side("Cold drink")
      expect(order.total_price).to eq(pizza.total_price + 55)
    end
  end

  describe '#confirm' do
    it 'returns confirmation message with total price' do
      order.add_pizza(pizza)
      order.add_side("Cold drink")
      expect(order.confirm).to eq("Order placed successfully! Total amount: Rs. #{order.total_price}")
    end
  end
end
