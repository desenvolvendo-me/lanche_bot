# frozen_string_literal: true

require "lanche_bot/customer/customer"
require "lanche_bot/restaurant/restaurant"
require "lanche_bot/menu/menu_main"
require "lanche_bot/menu/menu_juice"

require "csv"

module Order
  # class to order
  class Order
    DATA_PATH = "data/orders.csv"
    attr_accessor :id, :customer, :restaurant, :items

    def initialize(customer, restaurant)
      @id = rand(2000)
      @customer = customer
      @restaurant = restaurant
      create(self)
    end

    def create(_itself)
      CSV.open(DATA_PATH, "ab") do |csv|
        csv << [id, customer, restaurant, items]
      end
      self
    end
  end
end
