require_relative '../lib/pizza.rb'  # Adjust path if inside Rails
require 'rspec'
require 'simplecov'
require 'spec_helper'

RSpec.describe Pizza do
  let(:veg_pizza) { Pizza.new("Deluxe Veggie", "medium", "Cheese Burst") }
  let(:non_veg_pizza) { Pizza.new("Chicken Tikka", "large", "Fresh pan pizza") }

  describe "#initialize" do
    it "sets the pizza name, size, crust, and base price correctly" do
      expect(veg_pizza.name).to eq("Deluxe Veggie")
      expect(veg_pizza.size).to eq(:medium)
      expect(veg_pizza.crust).to eq("Cheese Burst")
      expect(veg_pizza.base_price).to eq(200)
    end

    it "raises an error for invalid crust types" do
      expect { Pizza.new("Paneer Tikka", "large", "Invalid Crust") }.to raise_error("Invalid crust type selected!")
    end
  end

  describe "#add_topping" do
    it "adds valid vegetarian toppings to a vegetarian pizza" do
      veg_pizza.add_topping("Black olive")
      expect(veg_pizza.toppings).to include("Black olive")
    end

    it "adds valid non-vegetarian toppings to a non-vegetarian pizza" do
      non_veg_pizza.add_topping("Chicken tikka")
      expect(non_veg_pizza.toppings).to include("Chicken tikka")
    end

    it "does not allow vegetarian pizza to have non-veg toppings" do
      expect(veg_pizza.add_topping("Chicken tikka")).to eq("Invalid topping")
      expect(veg_pizza.toppings).not_to include("Chicken tikka")
    end

    it "does not allow non-veg pizza to have paneer topping" do
      expect(non_veg_pizza.add_topping("Paneer")).to eq("Invalid topping")
      expect(non_veg_pizza.toppings).not_to include("Paneer")
    end

    it "limits large pizzas to a maximum of 2 free toppings" do
      non_veg_pizza.add_topping("Capsicum")
      non_veg_pizza.add_topping("Black olive")
      expect(non_veg_pizza.add_topping("Mushroom")).to eq("Cannot add more than 2 toppings for Large size.")
    end
  end

  describe "#add_extra_cheese" do
    it "adds extra cheese to the pizza" do
      veg_pizza.add_extra_cheese
      expect(veg_pizza.extra_cheese).to be true
    end
  end

  describe "#total_price" do
    it "calculates correct price for a pizza without extra toppings or cheese" do
      expect(veg_pizza.total_price).to eq(200)
    end

    it "calculates correct price when extra cheese is added" do
      veg_pizza.add_extra_cheese
      expect(veg_pizza.total_price).to eq(235)
    end

    it "calculates correct price with additional toppings for non-large pizzas" do
      veg_pizza.add_topping("Capsicum")
      veg_pizza.add_topping("Mushroom")
      expect(veg_pizza.total_price).to eq(255) # Base price (200) + Capsicum (25) + Mushroom (30)
    end
  end
end
