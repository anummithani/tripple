require 'rails_helper'

RSpec.describe "sights#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sights/#{sight.id}", payload
  end

  describe 'basic update' do
    let!(:sight) { create(:sight) }

    let(:payload) do
      {
        data: {
          id: sight.id.to_s,
          type: 'sights',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SightResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { sight.reload.attributes }
    end
  end
end
