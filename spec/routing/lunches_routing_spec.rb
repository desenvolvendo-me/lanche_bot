# frozen_string_literal: true

require "rails_helper"

RSpec.describe LunchesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lunches").to route_to("lunches#index")
    end

    it "routes to #new" do
      expect(get: "/lunches/new").to route_to("lunches#new")
    end

    it "routes to #show" do
      expect(get: "/lunches/1").to route_to("lunches#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lunches/1/edit").to route_to("lunches#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/lunches").to route_to("lunches#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lunches/1").to route_to("lunches#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lunches/1").to route_to("lunches#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lunches/1").to route_to("lunches#destroy", id: "1")
    end
  end
end
