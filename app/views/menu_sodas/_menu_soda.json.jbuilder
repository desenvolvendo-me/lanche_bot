# frozen_string_literal: true

json.extract! menu_soda, :id, :name, :type, :price, :created_at, :updated_at
json.url menu_soda_url(menu_soda, format: :json)
