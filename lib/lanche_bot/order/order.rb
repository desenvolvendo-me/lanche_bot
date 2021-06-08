# frozen_string_literal: true

module Order
  # class to order
  class Order
    DATA_PATH = "data/orders.csv"
    attr_accessor :id, :customer, :restaurant, :items

    def initialize(customer, restaurant, items = [])
      @id = rand(2000)
      @customer = customer
      @customer_name = customer_detail
      @restaurant = restaurant
      @restaurant_name = restaurant_detail
      @items = items
    end

    def create
      errors = validate_fields
      if errors.empty?
        attributes = [id, @customer_name, @restaurant_name, items]
        Helpers.csv_include(DATA_PATH, attributes)
        self
      else
        errors
      end
    end

    def validate_fields
      errors = []
      errors << "O pedido deve ter ao menos 1 item" unless items.any?
      errors
    end

    def self.count_orders_by_costumer(name)
      arr = Helpers.csv_parse(DATA_PATH).select { |row| row["customer_name"] == name }
      arr.length
    end

    private

    def customer_detail
      customer.name
    end

    def restaurant_detail
      restaurant.name
    end
  end
end
