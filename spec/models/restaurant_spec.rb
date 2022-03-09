require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:trip) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:date) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:time) }

    it { should validate_presence_of(:trip_id) }

    end
end
