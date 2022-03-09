require 'rails_helper'

RSpec.describe "trip_photos#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/trip_photos/#{trip_photo.id}", payload
  end

  describe 'basic update' do
    let!(:trip_photo) { create(:trip_photo) }

    let(:payload) do
      {
        data: {
          id: trip_photo.id.to_s,
          type: 'trip_photos',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TripPhotoResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { trip_photo.reload.attributes }
    end
  end
end
