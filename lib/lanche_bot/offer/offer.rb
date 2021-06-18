# frozen_string_literal: true

require "lanche_bot/combo/combo"
require "lanche_bot/lunch/lunch"

module Offer
  # promocao
  class Offer
    attr_accessor :combo, :lunch, :juice, :quantity

    def initialize(combo, lunch, juice, quantity)
      @combo = combo
      @lunch = lunch
      @juice = juice
      @quantity = quantity
    end

    def discount
      @quantity > 1 ? "Direito a desconto" : "Não tem direito a desconto"
    end
  end
end
