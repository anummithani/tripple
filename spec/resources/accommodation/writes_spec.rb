require "rails_helper"

RSpec.describe AccommodationResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "accommodations",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AccommodationResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Accommodation.count }.by(1)
    end
  end

  describe "updating" do
    let!(:accommodation) { create(:accommodation) }

    let(:payload) do
      {
        data: {
          id: accommodation.id.to_s,
          type: "accommodations",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AccommodationResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { accommodation.reload.updated_at }
      # .and change { accommodation.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:accommodation) { create(:accommodation) }

    let(:instance) do
      AccommodationResource.find(id: accommodation.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Accommodation.count }.by(-1)
    end
  end
end
