require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:trip_photos) }

    it { should have_many(:recieved_friend_requests) }

    it { should have_many(:sent_friend_requests) }

    it { should have_many(:travelled_trips) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:profile_picture) }

    end
end
