# frozen_string_literal: true

require "lanche_bot/customer/customer"
require "lanche_bot/restaurant/restaurant"
require "lanche_bot/menu/menu_main"
require "lanche_bot/menu/menu_juice"
require "lanche_bot/menu/menu_soda"

require "csv"

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
      create(self)
    end

    def create(_itself)
      CSV.open(DATA_PATH, "ab") do |csv|
        csv << [id, @customer_name, @restaurant_name, items]
      end
      self
    end

    private

    def customer_detail
      customer["name"]
    end

    def restaurant_detail
      restaurant["name"]
    end
  end
end
