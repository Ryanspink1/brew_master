require 'rails_helper'

RSpec.describe Brewery, type: :model do
  context "validations" do
    it { should validate_presence_of(:fb_id)}
    it { should validate_presence_of(:name)}

    it { is_expected.to validate_uniqueness_of(:fb_id)}
  end

  context "relationships" do
    it { should have_many(:brewery_events) }
    it { should have_many(:events) }
    it { should have_many(:favorites) }
    it { should have_many(:users) }
  end

  describe "get_breweries" do
    attr_reader :breweries

    before(:each) do
      brewery_two   = Fabricate(:brewery, name:"b")
      brewery_three = Fabricate(:brewery, name:"c")
      brewery_one   = Fabricate(:brewery, name:"a")
      @breweries = [brewery_one, brewery_two, brewery_three]
    end

    it "returns correct number of breweries" do
      get_breweries_response = Brewery.get_breweries

      expect(get_breweries_response.count).to eq(3)
    end

    it "returns all breweries with correct attributes ordered by name" do
      get_breweries_response = Brewery.get_breweries

      @breweries.each_with_index do |brewery, index|

        brewery_response = get_breweries_response[index]

        expect(brewery.id).to          eq(brewery_response.id)
        expect(brewery.fb_id).to       eq(brewery_response.fb_id)
        expect(brewery.name).to        eq(brewery_response.name)
        expect(brewery.phone).to       eq(brewery_response.phone)
        expect(brewery.email).to       eq(brewery_response.email)
        expect(brewery.address).to     eq(brewery_response.address)
        expect(brewery.city).to        eq(brewery_response.city)
        expect(brewery.state).to       eq(brewery_response.state)
        expect(brewery.about).to       eq(brewery_response.about)
        expect(brewery.photo).to       eq(brewery_response.photo)
        expect(brewery.description).to eq(brewery_response.description)
        expect(brewery.founded).to     eq(brewery_response.founded)
        expect(brewery.url).to         eq(brewery_response.url)
        expect(brewery.zip_code).to    eq(brewery_response.zip_code)
      end
    end
  end

  describe "get_brewery" do
    attr_reader :breweries

    before(:each) do
      brewery_two   = Fabricate(:brewery, name:"b")
      brewery_three = Fabricate(:brewery, name:"c")
      brewery_one   = Fabricate(:brewery, name:"a")
      @breweries = [brewery_one, brewery_two, brewery_three]
    end

    it "returns correct number of breweries" do
      get_brewery = [Brewery.get_brewery(@breweries.sample.id)]

      expect(get_brewery.count).to     eq(1)
      expect(get_brewery.count).to_not eq(0)
    end

    it "returns the correct brewery with correct attributes" do
      @breweries.each_with_index do |brewery, index|
        brewery_response = Brewery.get_brewery(brewery.id)

        expect(brewery.id).to          eq(brewery_response.id)
        expect(brewery.fb_id).to       eq(brewery_response.fb_id)
        expect(brewery.name).to        eq(brewery_response.name)
        expect(brewery.phone).to       eq(brewery_response.phone)
        expect(brewery.email).to       eq(brewery_response.email)
        expect(brewery.address).to     eq(brewery_response.address)
        expect(brewery.city).to        eq(brewery_response.city)
        expect(brewery.state).to       eq(brewery_response.state)
        expect(brewery.about).to       eq(brewery_response.about)
        expect(brewery.photo).to       eq(brewery_response.photo)
        expect(brewery.description).to eq(brewery_response.description)
        expect(brewery.founded).to     eq(brewery_response.founded)
        expect(brewery.url).to         eq(brewery_response.url)
        expect(brewery.zip_code).to    eq(brewery_response.zip_code)
      end
    end
  end

  describe "get_events" do
    attr_reader :breweries_and_events

    before(:each) do
      brewery_one = Fabricate(:brewery, id:1, name:"b")
      brewery_two = Fabricate(:brewery, id:2, name:"c")

      event_one   = Fabricate(:event, id:1, end_time: (Time.now+100000).to_s)
      event_two   = Fabricate(:event, id:2, end_time: (Time.now+200000).to_s)
      event_three = Fabricate(:event, id:3, end_time: (Time.now+300000).to_s)
      event_four  = Fabricate(:event, id:4, end_time: (Time.now+400000).to_s)

      Fabricate(:brewery_event, brewery_id:1, event_id:1)
      Fabricate(:brewery_event, brewery_id:1, event_id:2)
      Fabricate(:brewery_event, brewery_id:1, event_id:3)
      Fabricate(:brewery_event, brewery_id:2, event_id:4)

      @breweries_and_events = [[brewery_one,[event_one, event_two, event_three]],
                              [brewery_two,[event_four]]]
    end

    it "returns correct number of events" do
      get_events_response     = Brewery.get_events(1)
      get_events_response_two = Brewery.get_events(2)

      expect(get_events_response.count).to     eq(3)
      expect(get_events_response_two.count).to eq(1)

      expect(get_events_response.count).to_not     eq(0)
      expect(get_events_response_two.count).to_not eq(0)
    end

    it "returns all events for particular brewery ordered by end_time" do
      @breweries_and_events.each do |array|
        brewery             = array[0]
        get_events_response = Brewery.get_events(brewery.id)
        created_events      = array[1]

        get_events_response.each_with_index do |event, index|
          created_event = created_events[index]

          expect(event.id).to          eq(created_event.id)
          expect(event.fb_id).to       eq(created_event.fb_id)
          expect(event.name).to        eq(created_event.name)
          expect(event.cover).to       eq(created_event.cover)
          expect(event.description).to eq(created_event.description)
          expect(event.start_time).to  eq(created_event.start_time)
          expect(event.end_time).to    eq(created_event.end_time)
          expect(event.place).to       eq(created_event.place)
          expect(event.address).to     eq(created_event.address)
          expect(event.city).to        eq(created_event.city)
          expect(event.state).to       eq(created_event.state)
          expect(event.brewery_id).to  eq(created_event.brewery_id)
        end
      end
    end
  end
end
