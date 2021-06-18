# frozen_string_literal: true

# MenuJuice holds the information about the name, cup size and price.
class MenuJuice < ApplicationRecord
  validates :name, presence: true
  validates :cup_size, presence: true
  validates :price, presence: true
end
