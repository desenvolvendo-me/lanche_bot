# frozen_string_literal: true

require "csv"

module Customer
  # classe customer
  class Customer
    DATA_PATH = "data/customers.csv"
    attr_accessor :id, :name, :phone

    def initialize(name, phone)
      @id = rand(2000)
      @name = name
      @phone = phone
      create(self)
    end

    def create(_itself)
      CSV.open(DATA_PATH, "ab") do |csv|
        csv << [id, name, phone]
      end
      self
    end

    def self.find(id)
      data = CSV.read(DATA_PATH, { col_sep: ",", headers: true })
      data.each do |line|
        return line if line["id"] == id
      end
    end
  end
end
