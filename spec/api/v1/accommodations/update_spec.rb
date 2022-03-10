require "rails_helper"

RSpec.describe "accommodations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/accommodations/#{accommodation.id}", payload
  end

  describe "basic update" do
    let!(:accommodation) { create(:accommodation) }

    let(:payload) do
      {
        data: {
          id: accommodation.id.to_s,
          type: "accommodations",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AccommodationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { accommodation.reload.attributes }
    end
  end
end
