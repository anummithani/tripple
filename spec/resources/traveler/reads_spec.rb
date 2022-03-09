require "rails_helper"

RSpec.describe TravelerResource, type: :resource do
  describe "serialization" do
    let!(:traveler) { create(:traveler) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(traveler.id)
      expect(data.jsonapi_type).to eq("travelers")
    end
  end

  describe "filtering" do
    let!(:traveler1) { create(:traveler) }
    let!(:traveler2) { create(:traveler) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: traveler2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([traveler2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:traveler1) { create(:traveler) }
      let!(:traveler2) { create(:traveler) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      traveler1.id,
                                      traveler2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      traveler2.id,
                                      traveler1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
