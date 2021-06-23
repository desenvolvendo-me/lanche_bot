# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :menu_juice
  belongs_to :menu_main
  belongs_to :restaurant
end
