require "rails_helper"

RSpec.describe "sights#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sights/#{sight.id}", params: params
  end

  describe "basic fetch" do
    let!(:sight) { create(:sight) }

    it "works" do
      expect(SightResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("sights")
      expect(d.id).to eq(sight.id)
    end
  end
end
