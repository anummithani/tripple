require "rails_helper"

RSpec.describe "trip_photos#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/trip_photos", params: params
  end

  describe "basic fetch" do
    let!(:trip_photo1) { create(:trip_photo) }
    let!(:trip_photo2) { create(:trip_photo) }

    it "works" do
      expect(TripPhotoResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["trip_photos"])
      expect(d.map(&:id)).to match_array([trip_photo1.id, trip_photo2.id])
    end
  end
end
