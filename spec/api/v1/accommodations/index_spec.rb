require "rails_helper"

RSpec.describe "accommodations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/accommodations", params: params
  end

  describe "basic fetch" do
    let!(:accommodation1) { create(:accommodation) }
    let!(:accommodation2) { create(:accommodation) }

    it "works" do
      expect(AccommodationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["accommodations"])
      expect(d.map(&:id)).to match_array([accommodation1.id, accommodation2.id])
    end
  end
end
