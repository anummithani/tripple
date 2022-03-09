require 'rails_helper'

RSpec.describe Trip, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:arrival_date) }

    it { should validate_presence_of(:city) }

    it { should validate_presence_of(:country) }

    it { should validate_presence_of(:departure_date) }

    it { should validate_presence_of(:trip_image) }

    it { should validate_presence_of(:trip_name) }

    end
end
