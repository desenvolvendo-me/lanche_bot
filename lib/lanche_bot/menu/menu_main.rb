# frozen_string_literal: true

module Menu
  # menuPrincipal
  class MenuMain
    attr_accessor :price
    attr_reader :name, :description, :id

    def initialize(name, description, price)
      @name = name
      @description = description
      @price = price
    end
  end
end
