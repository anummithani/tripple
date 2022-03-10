require "rails_helper"

RSpec.describe "accommodations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/accommodations/#{accommodation.id}", params: params
  end

  describe "basic fetch" do
    let!(:accommodation) { create(:accommodation) }

    it "works" do
      expect(AccommodationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("accommodations")
      expect(d.id).to eq(accommodation.id)
    end
  end
end
