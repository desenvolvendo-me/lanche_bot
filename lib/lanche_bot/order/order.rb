# frozen_string_literal: true

require "lanche_bot/customer/customer"
require "lanche_bot/restaurant/restaurant"
require "lanche_bot/menu/menu_main"
require "lanche_bot/menu/menu_juice"

module Order
  # class to order
  class Order
    attr_accessor :customer, :restaurant, :items

    def initialize(customer, restaurant)
      @customer = customer
      @restaurant = restaurant
    end
  end
end
