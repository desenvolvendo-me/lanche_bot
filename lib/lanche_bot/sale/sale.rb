# frozen_string_literal: true

require "lanche_bot/customer/customer"
require "lanche_bot/combo/combo"
require "lanche_bot/lunch/lunch"

module Sale
  # promocao
  class Sale
    attr_accessor :combo, :customer, :lunch, :juice, :quantity

    def initialize(combo, customer, lunch, juice, quantity)
      @combo = combo
      @customer = customer
      @lunch = lunch
      @juice = juice
      @quantity = quantity
    end
  end
end
