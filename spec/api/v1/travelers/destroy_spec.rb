require "rails_helper"

RSpec.describe "travelers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/travelers/#{traveler.id}"
  end

  describe "basic destroy" do
    let!(:traveler) { create(:traveler) }

    it "updates the resource" do
      expect(TravelerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Traveler.count }.by(-1)
      expect { traveler.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
