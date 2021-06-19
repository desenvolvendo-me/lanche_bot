# frozen_string_literal: true

json.array! @restaurants, partial: "restaurants/restaurant", as: :restaurant
