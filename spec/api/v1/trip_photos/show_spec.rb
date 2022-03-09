require 'rails_helper'

RSpec.describe "trip_photos#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/trip_photos/#{trip_photo.id}", params: params
  end

  describe 'basic fetch' do
    let!(:trip_photo) { create(:trip_photo) }

    it 'works' do
      expect(TripPhotoResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('trip_photos')
      expect(d.id).to eq(trip_photo.id)
    end
  end
end
