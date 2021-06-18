require "rails_helper"

RSpec.describe RestaurantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/restaurants").to route_to("restaurants#index")
    end

    it "routes to #new" do
      expect(get: "/restaurants/new").to route_to("restaurants#new")
    end

    it "routes to #show" do
      expect(get: "/restaurants/1").to route_to("restaurants#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/restaurants/1/edit").to route_to("restaurants#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/restaurants").to route_to("restaurants#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/restaurants/1").to route_to("restaurants#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/restaurants/1").to route_to("restaurants#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/restaurants/1").to route_to("restaurants#destroy", id: "1")
    end
  end
end
