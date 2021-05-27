# frozen_string_literal: true

require "lanche_bot/menu/menu_main"
require "lanche_bot/menu/menu_juice"

module Combo
  # combo
  class Combo
    attr_accessor :menu_main, :menu_juice, :free

    def initialize(menu_main, menu_juice, free = nil)
      @menu_main = menu_main
      @menu_juice = menu_juice
      @free = free
    end

    def free_item
      return "There is no free item marked yet." if @free.nil?
      item = [@menu_main, @menu_juice][@free - 1]
      item.name
    end
  end
end
