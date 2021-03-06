require "rails_helper"

RSpec.describe "restaurants#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/restaurants/#{restaurant.id}"
  end

  describe "basic destroy" do
    let!(:restaurant) { create(:restaurant) }

    it "updates the resource" do
      expect(RestaurantResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Restaurant.count }.by(-1)
      expect { restaurant.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
