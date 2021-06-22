# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :menu_juice
  belongs_to :menu_main
end
