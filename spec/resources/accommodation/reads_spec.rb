require "rails_helper"

RSpec.describe AccommodationResource, type: :resource do
  describe "serialization" do
    let!(:accommodation) { create(:accommodation) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(accommodation.id)
      expect(data.jsonapi_type).to eq("accommodations")
    end
  end

  describe "filtering" do
    let!(:accommodation1) { create(:accommodation) }
    let!(:accommodation2) { create(:accommodation) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: accommodation2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([accommodation2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:accommodation1) { create(:accommodation) }
      let!(:accommodation2) { create(:accommodation) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      accommodation1.id,
                                      accommodation2.id,
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
                                      accommodation2.id,
                                      accommodation1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
