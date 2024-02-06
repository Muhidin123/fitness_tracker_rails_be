require "rails_helper"

RSpec.describe DailyGoalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/daily_goals").to route_to("daily_goals#index")
    end

    it "routes to #show" do
      expect(get: "/daily_goals/1").to route_to("daily_goals#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/daily_goals").to route_to("daily_goals#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/daily_goals/1").to route_to("daily_goals#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/daily_goals/1").to route_to("daily_goals#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/daily_goals/1").to route_to("daily_goals#destroy", id: "1")
    end
  end
end
