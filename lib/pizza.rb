class Pizza
  attr_accessor :name, :size, :crust, :toppings, :extra_cheese, :base_price

  SIZE_PRICES = {
    "Deluxe Veggie" => { regular: 150, medium: 200, large: 325 },
    "Cheese and Corn" => { regular: 175, medium: 375, large: 475 },
    "Paneer Tikka" => { regular: 160, medium: 290, large: 340 },
    "Non-Veg Supreme" => { regular: 190, medium: 325, large: 425 },
    "Chicken Tikka" => { regular: 210, medium: 370, large: 500 },
    "Pepper Barbecue Chicken" => { regular: 220, medium: 380, large: 525 }
  }

  CRUST_TYPES = ["New hand tossed", "Wheat thin crust", "Cheese Burst", "Fresh pan pizza"]

  VEG_TOPPINGS = {
    "Black olive" => 20,
    "Capsicum" => 25,
    "Paneer" => 35,
    "Mushroom" => 30,
    "Fresh tomato" => 10
  }

  NON_VEG_TOPPINGS = {
    "Chicken tikka" => 35,
    "Barbeque chicken" => 45,
    "Grilled chicken" => 40
  }

  EXTRA_CHEESE_PRICE = 35

  def initialize(name, size, crust)
    @name = name
    @size = size.to_sym
    @crust = crust
    @toppings = []
    @extra_cheese = false
    @base_price = SIZE_PRICES[name][@size]
    validate_crust
  end

  private

  def validate_crust
    unless CRUST_TYPES.include?(@crust)
      raise "Invalid crust type selected!"
    end
  end
end
  