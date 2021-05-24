# frozen_string_literal: true

module Customer
  # classe customer
  class Customer
    attr_accessor :name, :phone

    def initialize(name, phone)
      @name = name
      @phone = phone
    end
  end
end
