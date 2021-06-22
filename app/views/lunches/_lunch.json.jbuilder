# frozen_string_literal: true

json.extract! lunch, :id, :name, :price, :created_at, :updated_at
json.url lunch_url(lunch, format: :json)
