# frozen_string_literal: true

# Welcome Customer
class WelcomeController < ApplicationController
  def welcome
    render json: "Olá Lanche Bot"
  end
end
