require "rails_helper"

RSpec.describe "travelers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/travelers/#{traveler.id}", payload
  end

  describe "basic update" do
    let!(:traveler) { create(:traveler) }

    let(:payload) do
      {
        data: {
          id: traveler.id.to_s,
          type: "travelers",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(TravelerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { traveler.reload.attributes }
    end
  end
end
