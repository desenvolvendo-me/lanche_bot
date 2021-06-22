# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    customer { nil }
    menu_juice { nil }
    menu_main { nil }
    restaurant { nil }
  end
end
