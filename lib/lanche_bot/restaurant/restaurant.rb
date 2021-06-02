# frozen_string_literal: true

module Restaurant
  # Restaurant will has name and address
  class Restaurant
    DATA_PATH = "data/restaurants.csv"
    attr_reader :id, :name, :address

    def initialize(name, address)
      @id = rand(2000)
      @name = name
      @address = address
      create(self)
    end

    def self.restaurants
      Helpers.csv_parse(DATA_PATH).map do |row|
        Restaurant.new(row["name"], row["address"], is_open: (!!row["open"]), id: row["id"])
      end
    end

    def create
      attributes = [id, name, address, open]
      Helpers.csv_include(DATA_PATH, attributes)
      self
    end
  end
end
