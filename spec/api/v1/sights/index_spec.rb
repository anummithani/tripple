require "rails_helper"

RSpec.describe "sights#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sights", params: params
  end

  describe "basic fetch" do
    let!(:sight1) { create(:sight) }
    let!(:sight2) { create(:sight) }

    it "works" do
      expect(SightResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["sights"])
      expect(d.map(&:id)).to match_array([sight1.id, sight2.id])
    end
  end
end
