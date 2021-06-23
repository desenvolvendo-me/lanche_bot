# frozen_string_literal: true

json.extract! order, :id, :customer_id, :menu_juice_id, :menu_main_id, :restaurant_id, :created_at, :updated_at
json.url order_url(order, format: :json)
