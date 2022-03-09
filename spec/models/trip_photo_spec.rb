require 'rails_helper'

RSpec.describe TripPhoto, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:trip) }

    it { should belong_to(:uploading_user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:caption) }

    it { should validate_presence_of(:image) }

    it { should validate_presence_of(:trip_id) }

    it { should validate_presence_of(:uploading_user_id) }

    end
end
