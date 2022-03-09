require "rails_helper"

RSpec.describe TravelerResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "travelers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      TravelerResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Traveler.count }.by(1)
    end
  end

  describe "updating" do
    let!(:traveler) { create(:traveler) }

    let(:payload) do
      {
        data: {
          id: traveler.id.to_s,
          type: "travelers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      TravelerResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { traveler.reload.updated_at }
      # .and change { traveler.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:traveler) { create(:traveler) }

    let(:instance) do
      TravelerResource.find(id: traveler.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Traveler.count }.by(-1)
    end
  end
end
