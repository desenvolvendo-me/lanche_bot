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
    end

    def create
      if validar_dados.empty?
        CSV.open(DATA_PATH, "ab") do |csv|
          csv << [id, name, address]
        end
        self
      else
        validar_dados
      end
    end

    def validar_dados
      erros = []
      erros << "O Nome não pode ser vazio" if name.empty?
      erros << "O Endereço não pode ser vazio" if address.empty?
      puts erros
      erros
    end
  end
end
