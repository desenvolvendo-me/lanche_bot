# frozen_string_literal: true

module Order
  # class to order
  class Order
    DATA_PATH = "data/orders.csv"
    attr_reader :id, :customer, :restaurant, :items, :confirmed

    def initialize(args)
      @id = rand(2000)
      @customer = args.fetch(:customer)
      @restaurant = args.fetch(:restaurant)
      @items = args.fetch(:items, [])
      @confirmed = args.fetch(:confirmed, false)
    end

    def create
      errors = validate_fields
      if errors.empty?
        attributes = [id, customer.name, customer.phone, restaurant.name, items, confirmed.to_s]
        Helpers.csv_include(DATA_PATH, attributes)
        { order: self, message: new_customer?, total_price: total_price }
      else
        { order: nil, message: errors }
      end
    end

    def validate_fields
      errors = []
      errors << "O pedido deve ter ao menos 1 item" unless items.any?
      errors
    end

    def self.count_orders_by_costumer(phone)
      arr = Helpers.csv_parse(DATA_PATH).select { |row| row["customer_phone"] == phone }
      arr.length
    end

    def new_customer?
      "Olá, aqui é da Lanchonete #{restaurant.name}" if Order.count_orders_by_costumer(customer.phone) == 1
    end

    def order_confirmed?
      "Seu Pedido Foi Confirmado!" if @confirmed
    end

    def confirm_order
      @confirmed = true
    end

    def total_price
      items.sum(&:price)
    end
  end
end
