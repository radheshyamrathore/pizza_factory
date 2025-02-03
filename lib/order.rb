require 'byebug'
class Order
  attr_accessor :pizzas, :sides

  SIDE_ITEMS = {
    "Cold drink" => 55,
    "Mousse cake" => 90
  }
end
