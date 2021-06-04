# frozen_string_literal: true

module Restaurant
  # Restaurant will has name and address
  class Restaurant
    DATA_PATH = "data/restaurants.csv"
    attr_reader :id, :name, :address
    attr_accessor :open

    def initialize(name, address, is_open: false, id: rand(2000))
      @id = id
      @name = name
      @address = address
      @open = is_open
    end

    def create
      erro = validar_dados
      if erro.empty?
        attributes = [id, name, address, open]
        Helpers.csv_include(DATA_PATH, attributes)
        self
      else
        erro
      end
    end

    def validar_dados
      erros = []
      erros << "O Nome não pode ser vazio" if name.nil? || name.empty?
      erros << "O Endereço não pode ser vazio" if address.nil? || address.empty?
      erros
    end

    def self.restaurants
      Helpers.csv_parse(DATA_PATH).map do |row|
        open = row["open"] == "true"
        Restaurant.new(row["name"], row["address"], is_open: open, id: row["id"])
      end
    end

    def self.find(id)
      data = CSV.read(DATA_PATH, { col_sep: ",", headers: true })
      data.each do |line|
        return line if line["id"] == id
      end
    end

    def open!
      self.open = true
    end

    def close!
      self.open = false
    end
  end
end
