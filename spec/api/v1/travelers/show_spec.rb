require "rails_helper"

RSpec.describe "travelers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/travelers/#{traveler.id}", params: params
  end

  describe "basic fetch" do
    let!(:traveler) { create(:traveler) }

    it "works" do
      expect(TravelerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("travelers")
      expect(d.id).to eq(traveler.id)
    end
  end
end
