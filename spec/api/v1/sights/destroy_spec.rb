require "rails_helper"

RSpec.describe "sights#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sights/#{sight.id}"
  end

  describe "basic destroy" do
    let!(:sight) { create(:sight) }

    it "updates the resource" do
      expect(SightResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Sight.count }.by(-1)
      expect { sight.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
