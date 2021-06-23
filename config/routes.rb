# frozen_string_literal: true

Rails.application.routes.draw do
  get 'menu_juices/index'
  get 'menu_juices/show'
  get 'menu_juices/new'
  get 'menu_juices/create'
  get 'menu_juices/edit'
  get 'menu_juices/update'
  get 'menu_juices/destroy'
  get 'menu_juices/index'
  get 'menu_juices/show'
  get 'menu_juices/create'
  get 'menu_juices/update'
  resources :orders
  resources :menu_mains
  root "welcome#welcome"
  resources :restaurants
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
