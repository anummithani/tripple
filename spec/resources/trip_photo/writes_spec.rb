require "rails_helper"

RSpec.describe TripPhotoResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "trip_photos",
          attributes: {},
        },
      }
    end

    let(:instance) do
      TripPhotoResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { TripPhoto.count }.by(1)
    end
  end

  describe "updating" do
    let!(:trip_photo) { create(:trip_photo) }

    let(:payload) do
      {
        data: {
          id: trip_photo.id.to_s,
          type: "trip_photos",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      TripPhotoResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { trip_photo.reload.updated_at }
      # .and change { trip_photo.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:trip_photo) { create(:trip_photo) }

    let(:instance) do
      TripPhotoResource.find(id: trip_photo.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { TripPhoto.count }.by(-1)
    end
  end
end
