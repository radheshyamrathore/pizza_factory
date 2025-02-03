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
end
