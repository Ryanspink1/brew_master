require 'rails_helper'

RSpec.describe Brewery, type: :model do
  context "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:owner)}
    it { should validate_presence_of(:address)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:creation_date)}
    it { should validate_presence_of(:url)}

    it { is_expected.to validate_uniqueness_of(:name)}
    it { is_expected.to validate_uniqueness_of(:owner)}
    it { is_expected.to validate_uniqueness_of(:description)}
    it { is_expected.to validate_uniqueness_of(:url)}
  end
end
