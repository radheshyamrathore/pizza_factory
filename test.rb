# test.rb
require_relative 'lib/pizza'
require_relative 'lib/order'

# Create a new order
order = Order.new

puts "Welcome to PizzaFactory! Let's create your order."

# Menu options
PIZZA_MENU = [
  "Deluxe Veggie",
  "Cheese and Corn",
  "Paneer Tikka",
  "Non-Veg Supreme",
  "Chicken Tikka",
  "Pepper Barbecue Chicken"
]

CRUST_TYPES = ["New hand tossed", "Wheat thin crust", "Cheese Burst", "Fresh pan pizza"]

VEG_TOPPINGS = ["Black olive", "Capsicum", "Paneer", "Mushroom", "Fresh tomato"]
NON_VEG_TOPPINGS = ["Chicken tikka", "Barbeque chicken", "Grilled chicken"]

SIDE_ITEMS = ["Cold drink", "Mousse cake"]

loop do
  # Select Pizza
  puts "\nAvailable Pizzas:"
  PIZZA_MENU.each_with_index { |pizza, index| puts "#{index + 1}. #{pizza}" }
  print "Select a pizza by number (or type 'done' to finish ordering): "
  pizza_choice = gets.chomp
  break if pizza_choice.downcase == 'done'

  pizza_name = PIZZA_MENU[pizza_choice.to_i - 1]
  
  # Select Size
  print "Choose size (regular, medium, large): "
  size = gets.chomp.downcase

  # Select Crust
  puts "Available crusts:"
  CRUST_TYPES.each_with_index { |crust, index| puts "#{index + 1}. #{crust}" }
  print "Select a crust by number: "
  crust_choice = gets.chomp
  crust = CRUST_TYPES[crust_choice.to_i - 1]

  # Create Pizza
  pizza = Pizza.new(pizza_name, size, crust)

  # Add Toppings
  puts "Would you like to add toppings? (yes/no): "
  if gets.chomp.downcase == 'yes'
    available_toppings = ["Deluxe Veggie", "Cheese and Corn", "Paneer Tikka"].include?(pizza_name) ? VEG_TOPPINGS : NON_VEG_TOPPINGS

    puts "Available toppings:"
    available_toppings.each_with_index { |topping, index| puts "#{index + 1}. #{topping}" }
    
    loop do
      print "Select a topping by number (or type 'done' to finish): "
      topping_choice = gets.chomp
      break if topping_choice.downcase == 'done'
      
      topping = available_toppings[topping_choice.to_i - 1]
      pizza.add_topping(topping)
    end
  end

  # Ask for Extra Cheese
  print "Would you like to add extra cheese for Rs. 35? (yes/no): "
  if gets.chomp.downcase == 'yes'
    pizza.add_extra_cheese
  end

  order.add_pizza(pizza)
end

# Add Sides
puts "\nWould you like to add side items? (yes/no): "
if gets.chomp.downcase == 'yes'
  puts "Available side items:"
  SIDE_ITEMS.each_with_index { |side, index| puts "#{index + 1}. #{side}" }

  loop do
    print "Select a side by number (or type 'done' to finish): "
    side_choice = gets.chomp
    break if side_choice.downcase == 'done'
    
    side = SIDE_ITEMS[side_choice.to_i - 1]
    order.add_side(side)
  end
end

# Confirm Order
puts "\nYour order summary:"
order.pizzas.each_with_index do |pizza, index|
  puts "#{index + 1}. #{pizza.name} (#{pizza.size.capitalize}) with #{pizza.crust} crust"
  puts "   Toppings: #{pizza.toppings.join(', ')}" unless pizza.toppings.empty?
  puts "   Extra Cheese: Yes" if pizza.extra_cheese
end

unless order.sides.empty?
  puts "Sides: #{order.sides.join(', ')}"
end

puts "\nTotal Price: Rs. #{order.total_price}"
puts "Order placed successfully! Thank you for ordering from PizzaFactory!"
