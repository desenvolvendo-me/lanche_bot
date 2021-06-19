# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    name { "MyString" }
    address { "MyString" }
    opening_time { "2021-06-18" }
    is_open { false }
  end
end
