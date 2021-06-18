# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { FFaker::Name.first_name }
    phone { FFaker::PhoneNumberBR.phone_number }
  end
end
