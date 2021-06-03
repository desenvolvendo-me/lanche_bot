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
    end

    def create
      if validar_dados.empty?
        CSV.open(DATA_PATH, "ab") do |csv|
          csv << [id, name, phone]
        end
        self
      else
        validar_dados
      end
    end

    def validar_dados
      erros = []
      erros << "O Nome não pode ser vazio" if name.empty?
      erros << "O Phone não pode ser vazio" if phone.empty?
      erros
    end
  end
end
