require 'rails_helper'

RSpec.describe Event, type: :model do
  context "validations" do
    it { should validate_presence_of(:fb_id)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:cover)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:start_time)}
    it { should validate_presence_of(:end_time)}
    it { should validate_presence_of(:place)}
    it { should validate_presence_of(:address)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:brewery_id)}

    it { is_expected.to validate_uniqueness_of(:fb_id)}
  end

  context "relationships" do
    it { should have_many(:brewery_events) }
    it { should have_many(:breweries) }
  end
end
