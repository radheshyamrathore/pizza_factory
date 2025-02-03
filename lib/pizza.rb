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

  def add_topping(topping)
    return "Invalid topping" unless valid_topping?(topping)

    if @size == :large && @toppings.size < 2
      @toppings << topping  # Large pizzas allow 2 free toppings
    elsif @size == :large && @toppings.size >= 2
      return "Cannot add more than 2 toppings for Large size."
    else
      @toppings << topping
    end
  end

  def add_extra_cheese
    @extra_cheese = true
  end

  def total_price
    extra_toppings_cost = if @size == :large && @toppings.size <= 2
                            0
                          else
                            @toppings.map { |t| topping_price(t) }.sum
                          end
    cheese_cost = @extra_cheese ? EXTRA_CHEESE_PRICE : 0

    @base_price + extra_toppings_cost + cheese_cost
  end

  private

  def valid_topping?(topping)
    return false unless VEG_TOPPINGS.keys.include?(topping) || NON_VEG_TOPPINGS.keys.include?(topping)

    if vegetarian? && NON_VEG_TOPPINGS.keys.include?(topping)
      return false # Vegetarian pizzas cannot have non-veg toppings
    elsif !vegetarian? && topping == "Paneer"
      return false # Non-veg pizzas cannot have Paneer
    elsif !vegetarian? && NON_VEG_TOPPINGS.keys.include?(topping) && @toppings.any? { |t| NON_VEG_TOPPINGS.keys.include?(t) }
      return false # Non-veg pizzas can only have one non-veg topping
    end

    true
  end

  def validate_crust
    unless CRUST_TYPES.include?(@crust)
      raise "Invalid crust type selected!"
    end
  end

  def vegetarian?
    ["Deluxe Veggie", "Cheese and Corn", "Paneer Tikka"].include?(@name)
  end

  def topping_price(topping)
    VEG_TOPPINGS[topping] || NON_VEG_TOPPINGS[topping] || 0
  end
end
  