# frozen_string_literal: true

require "lanche_bot/customer/customer"
require "lanche_bot/restaurant/restaurant"

module Order
  # class to order
  class Order
    attr_accessor :customer, :restaurant

    def initialize(customer, restaurant)
      @customer = customer
      @restaurant = restaurant
    end
  end
end
