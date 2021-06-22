# frozen_string_literal: true

json.extract! offer, :id, :price, :menu_juice_id, :menu_main_id, :created_at, :updated_at
json.url offer_url(offer, format: :json)
