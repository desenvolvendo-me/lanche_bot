class WelcomeController < ApplicationController
  def welcome
    render json: "Olá Lanche Bot"
  end
end
