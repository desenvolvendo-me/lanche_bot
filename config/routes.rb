# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#welcome'
  resources :restaurants
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
