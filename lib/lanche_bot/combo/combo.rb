# frozen_string_literal: true

require "lanche_bot/menu/menu_main"
require "lanche_bot/menu/menu_juice"

module Combo
  # combo
  class Combo
    attr_accessor :menu_main, :menu_juice

    def initialize(menu_main, menu_juice)
      @menu_main = menu_main
      @menu_juice = menu_juice
    end
  end
end
