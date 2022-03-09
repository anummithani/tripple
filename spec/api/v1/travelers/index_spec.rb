require "rails_helper"

RSpec.describe "travelers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/travelers", params: params
  end

  describe "basic fetch" do
    let!(:traveler1) { create(:traveler) }
    let!(:traveler2) { create(:traveler) }

    it "works" do
      expect(TravelerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["travelers"])
      expect(d.map(&:id)).to match_array([traveler1.id, traveler2.id])
    end
  end
end
