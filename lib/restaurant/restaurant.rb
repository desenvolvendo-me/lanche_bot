# frozen_string_literal: true

module Restaurant
  # Restaurant will has name and address
  class Restaurant
    attr_reader :name, :address

    def initialize(name, address)
      @name = name
      @address = address
    end
  end
end
