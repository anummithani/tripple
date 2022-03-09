require "rails_helper"

RSpec.describe "trip_photos#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/trip_photos/#{trip_photo.id}"
  end

  describe "basic destroy" do
    let!(:trip_photo) { create(:trip_photo) }

    it "updates the resource" do
      expect(TripPhotoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { TripPhoto.count }.by(-1)
      expect { trip_photo.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
