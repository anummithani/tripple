require "rails_helper"

RSpec.describe "trip_photos#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/trip_photos", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "trip_photos",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(TripPhotoResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { TripPhoto.count }.by(1)
    end
  end
end
