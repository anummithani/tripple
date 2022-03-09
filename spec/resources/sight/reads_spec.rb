require 'rails_helper'

RSpec.describe SightResource, type: :resource do
  describe 'serialization' do
    let!(:sight) { create(:sight) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sight.id)
      expect(data.jsonapi_type).to eq('sights')
    end
  end

  describe 'filtering' do
    let!(:sight1) { create(:sight) }
    let!(:sight2) { create(:sight) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: sight2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([sight2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:sight1) { create(:sight) }
      let!(:sight2) { create(:sight) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            sight1.id,
            sight2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            sight2.id,
            sight1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
