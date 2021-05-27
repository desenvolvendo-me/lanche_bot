# frozen_string_literal: true

require "csv"

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

    def create(_itself)
      CSV.open(DATA_PATH, "ab") do |csv|
        csv << [id, name, address]
      end
      self
    end
  end
end
