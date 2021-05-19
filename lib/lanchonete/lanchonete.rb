# frozen_string_literal: true

module Lanchonete
  # Lanchonete will has name and address
  class Lanchonete
    attr_reader :name, :address

    def initialize(name, address)
      @name = name
      @address = address
    end
  end
end