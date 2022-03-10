require "rails_helper"

RSpec.describe "accommodations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/accommodations/#{accommodation.id}"
  end

  describe "basic destroy" do
    let!(:accommodation) { create(:accommodation) }

    it "updates the resource" do
      expect(AccommodationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Accommodation.count }.by(-1)
      expect { accommodation.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
