# frozen_string_literal: true

require "lanche_bot/customer/customer"
require "lanche_bot/combo/combo"
require "lanche_bot/lunch/lunch"

module Offer
  # promocao
  class Offer
    attr_accessor :combo, :customer, :lunch, :juice, :quantity

    def initialize(combo, lunch, juice, quantity)
      @combo = combo
      @lunch = lunch
      @juice = juice
      @quantity = quantity
    end
  end
end
