# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :phone, presence: true
end
