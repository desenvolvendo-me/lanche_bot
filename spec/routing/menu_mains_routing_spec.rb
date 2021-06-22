# frozen_string_literal: true

require "rails_helper"

RSpec.describe MenuMainsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/menu_mains").to route_to("menu_mains#index")
    end

    it "routes to #new" do
      expect(get: "/menu_mains/new").to route_to("menu_mains#new")
    end

    it "routes to #show" do
      expect(get: "/menu_mains/1").to route_to("menu_mains#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/menu_mains/1/edit").to route_to("menu_mains#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/menu_mains").to route_to("menu_mains#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/menu_mains/1").to route_to("menu_mains#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/menu_mains/1").to route_to("menu_mains#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/menu_mains/1").to route_to("menu_mains#destroy", id: "1")
    end
  end
end
