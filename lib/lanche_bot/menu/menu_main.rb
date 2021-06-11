# frozen_string_literal: true

module Menu
  # menuPrincipal
  class MenuMain
    attr_accessor :price
    attr_reader :name, :description, :id

    DATA_PATH = "data/menu_mains.csv"

    def initialize(args)
      @name = args.fetch(:name)
      @description = args.fetch(:description)
      @price = args.fetch(:price)
      @id = rand(2000)
    end

    def create
      CSV.open(DATA_PATH, "ab") do |csv|
        csv << [id, name, description, price]
      end
      self
    end

    def self.print_menu
      menu = Helpers.csv_parse(DATA_PATH)
      menu.map do |item|
        p "*****MENU****"
        p "#{item["id"]} - #{item["name"]} - #{item["description"]} - R$ #{item["price"]}"
        MenuMain.new({ name: item["name"], description: item["description"], price: item["price"] })
      end
    end
  end
end
