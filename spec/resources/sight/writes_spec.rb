require 'rails_helper'

RSpec.describe SightResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'sights',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SightResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Sight.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:sight) { create(:sight) }

    let(:payload) do
      {
        data: {
          id: sight.id.to_s,
          type: 'sights',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SightResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { sight.reload.updated_at }
      # .and change { sight.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:sight) { create(:sight) }

    let(:instance) do
      SightResource.find(id: sight.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Sight.count }.by(-1)
    end
  end
end
