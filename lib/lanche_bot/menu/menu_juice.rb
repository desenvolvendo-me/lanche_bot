# frozen_string_literal: true

module Menu
  # Menu de sucos
  class MenuJuice
    attr_accessor :price
    attr_reader :name, :cup_size

    def initialize(name, cup_size, price)
      @name = name
      @cup_size = cup_size
      @price = price
    end
  end
end
