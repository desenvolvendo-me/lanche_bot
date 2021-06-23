# frozen_string_literal: true

require "rails_helper"

RSpec.describe "MenuJuices", type: :request do
  # MenuJuice. As you add validations to Customer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end
  describe "GET /index" do
    it "returns http success" do
      MenuJuice.create! valid_attributes
      get "/menu_juices/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      MenuJuice.create! valid_attributes
      get "/menu_juices/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    xit "returns http success" do
      get "/menu_juices/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "valid" do
      it "creates a new MenuJuice" do
        expect do
          post "menu_juices/create", params: { menu_juice: valid_attributes }
        end.to change(MenuJuice, :count).by(1)
      end
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      MenuJuice.create! valid_attributes
      patch "/menu_juices/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      MenuJuice.create! valid_attributes
      get "/menu_juices/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      MenuJuice.create! valid_attributes
      get "/menu_juices/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
