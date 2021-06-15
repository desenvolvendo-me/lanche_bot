# frozen_string_literal: true

module Order
  # class to order
  class Order
    DATA_PATH = "data/orders.csv"
    attr_reader :id, :customer, :restaurant, :items, :confirmed, :canceled, :canceled_by
    attr_accessor :status

    def initialize(args)
      @id = rand(2000)
      @customer = args.fetch(:customer)
      @restaurant = args.fetch(:restaurant)
      @items = args.fetch(:items, [])
      @confirmed = args.fetch(:confirmed, false)
      @canceled = args.fetch(:canceled, false)
      @canceled_by = args.fetch(:canceled_by, "")
      @status = args.fetch(:status, "Esperando confirmação")
    end

    def create
      errors = validate_fields
      if errors.empty?
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
      if Order.count_orders_by_costumer(customer.phone) == 1
        "Olá, aqui é da Lanchonete #{restaurant.name}"
      else
        "Olá, #{customer.name}, fique à vontade pra escolher o seu lanche Vai querer o cardápio,"\
        " ou vai pedir o de sempre?"
      end
    end

    def order_confirmed?
      "Seu Pedido Foi Confirmado!" if confirmed
    end

    def order_canceled?
      "Seu Pedido Foi Cancelado por #{canceled_by}!" if canceled
    end

    def confirm_order
      @confirmed = true
      change_status
    end

    def cancel_order(by_canceled)
      @canceled = true
      @status = "Cancelado"
      case by_canceled
      when "Customer"
        @canceled_by = customer.name
      when "Restaurant"
        @canceled_by = restaurant.name
      end
    end

    def total_price
      items.sum(&:price)
    end

    def change_status
      return if %w[Cancelado Entregue].include?(status)

      index = all_status.find_index(status) + 1 || 0
      @status = all_status[index]
    end

    def all_status
      [
        "Esperando confirmação",
        "Confirmado",
        "Em espera para preparação",
        "Em preparação",
        "Pronto para entrega",
        "Saiu para entregar",
        "Entregue",
        "Cancelado"
      ]
    end

    private

    def attributes
      [id, customer.name, customer.phone, restaurant.name, items, confirmed.to_s, canceled, canceled_by]
    end
  end
end
