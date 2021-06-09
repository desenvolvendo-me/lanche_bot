# frozen_string_literal: true

require "csv"

module Customer
  # classe customer
  class Customer
    DATA_PATH = "data/customers.csv"
    attr_reader :id, :name, :phone

    def initialize(name, phone, id: rand(2000))
      @id = id
      @name = name
      @phone = phone
    end

    def self.all
      customers = Helpers.csv_parse(DATA_PATH)
      customers.map do |customer|
        Customer.new(customer["name"], customer["phone"], id: customer["id"])
      end
    end

    def create
      errors = validate_fields
      if errors.nil? || errors.empty?
        CSV.open(DATA_PATH, "ab") do |csv|
          csv << [id, name, phone]
        end
        self
      else
        errors
      end
    end

    def validate_fields
      errors = []
      errors << "O Nome não pode ser vazio" if name.nil? || name.empty?
      errors << "O Phone não pode ser vazio" if phone.nil? || phone.empty?
      errors << exists_phone?(phone)
      errors.flatten
    end

    def self.find(id)
      customers = Customer.all
      customers.select do |customer|
        return customer if customer.id == id
      end
    end

    def self.search_by_phone(customer_phone)
      customers = Customer.all
      customers.select do |customer|
        return customer if customer.phone == customer_phone
      end
    end

    private

    def exists_phone?
      Customer.all.select do |customer|
        return "Phone já existe" if customer.phone == phone
      end
    end
  end
end
