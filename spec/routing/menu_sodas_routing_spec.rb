# frozen_string_literal: true

require "rails_helper"

RSpec.describe MenuSodasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/menu_sodas").to route_to("menu_sodas#index")
    end

    it "routes to #new" do
      expect(get: "/menu_sodas/new").to route_to("menu_sodas#new")
    end

    it "routes to #show" do
      expect(get: "/menu_sodas/1").to route_to("menu_sodas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/menu_sodas/1/edit").to route_to("menu_sodas#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/menu_sodas").to route_to("menu_sodas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/menu_sodas/1").to route_to("menu_sodas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/menu_sodas/1").to route_to("menu_sodas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/menu_sodas/1").to route_to("menu_sodas#destroy", id: "1")
    end
  end
end
