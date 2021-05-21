# frozen_string_literal: true

module Menu
  # Menu de refrigerante
  class MenuSoda
    attr_reader :name, :type, :price

    def initialize(name, type, price)
      @name = name
      @type = type
      @price = price
    end
  end
end
