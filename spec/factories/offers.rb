# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    price { "9.99" }
    menu_juice { nil }
    menu_main { nil }
  end
end
