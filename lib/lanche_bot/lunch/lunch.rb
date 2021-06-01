# frozen_string_literal: true

module Lunch
  # lanches
  class Lunch
    attr_accessor :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end
  end
end
