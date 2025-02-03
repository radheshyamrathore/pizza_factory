# Acme Widget Co Basket System

This project implements a pizza factory system for create order and selection of pizzas based on its category like vegetarian or non-vegetarian and also calculate its total amount with extra charges.

## Requirements

- Ruby 3.2.2

## Setup

1. Clone the repository
2. Run `bundle install` to install dependencies

## Adding data to Order

For add pizzas and side items to order from input

```
ruby test.rb
```

## Running Tests

To run the tests, use the following command:

```
bundle exec rspec
```

## Implementation Details

This implementation uses a modular approach with separate classes for different concerns:

- `Pizza`: Represents a pizza type, size, Available toppings and also listed on crusts and price
- `Order`: Manages the pizza selection and category depend on selected type like(regular, medium, large)
- `Test`: The main class that manages the order of pizzas and show total amount of successful order.

The `Test` class uses dependency injection to receive the pizza, sizes, rules,category and calculation of order with extra side items or extra cheese quantity, allowing for easy modification and testing of different scenarios.

## Assumptions

- Pizza name, size, price and toppings(vegetarian, non-vegetarian) are unique
- Order selected pizza and side items with extra cheese charges are calculated based on the total after checking with its type.

## Future Improvements

- Implement a factory pattern for creating different types of offers
- Add more comprehensive error handling and logging
- Implement a caching mechanism for frequently accessed products or calculations
