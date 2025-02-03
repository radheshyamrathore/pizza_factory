class Order
  attr_accessor :pizzas, :sides

  SIDE_ITEMS = {
    "Cold drink" => 55,
    "Mousse cake" => 90
  }

  def initialize
    @pizzas = []
    @sides = []
  end

  def add_pizza(pizza)
    @pizzas << pizza
  end

  def add_side(side)
    return "Invalid side item" unless SIDE_ITEMS.key?(side)

    @sides << side
  end

  def total_price
    pizza_cost = @pizzas.map(&:total_price).sum
    side_cost = @sides.map { |s| SIDE_ITEMS[s] }.sum
    pizza_cost + side_cost
  end

  def confirm
    "Order placed successfully! Total amount: Rs. #{total_price}"
  end
end
