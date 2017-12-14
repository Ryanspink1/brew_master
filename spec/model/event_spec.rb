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
    it { should have_many(:user_events) }
    it { should have_many(:users) }
  end

  describe "new_events" do
    attr_reader :events

    before(:each) do
      event_one   = Fabricate(:event, created_at:(Time.now - 21000))
      event_two   = Fabricate(:event, created_at:(Time.now - 20000))
      event_three = Fabricate(:event, created_at:(Time.now - 30000))
      event_four  = Fabricate(:event, created_at:(Time.now - 40000))
      event_five  = Fabricate(:event, created_at:(Time.now - 90000))
      @events = [event_one, event_two, event_three, event_four, event_five]
    end

    it "returns correct number of events" do
      new_events_response = Event.new_events

      expect(new_events_response.count).to eq(4)
    end

    it "returns all events created within 24 hours" do
      new_events_response = Event.new_events

      @events.each_with_index do |event, index|
        unless index == 4
          expect(new_events_response.include?(event)).to     eq(true)
          expect(new_events_response.include?(event)).to_not eq(false)
        end
      end
    end

    it "returns all events created within 24 hours with correct attributes" do
      new_events_response = Event.new_events

      @events.each_with_index do |event, index|
        unless index == 4
          event_response = new_events_response[index]

          expect(event.id).to          eq(event_response.id)
          expect(event.name).to        eq(event_response.name)
          expect(event.cover).to       eq(event_response.cover)
          expect(event.description).to eq(event_response.description)
          expect(event.start_time).to  eq(event_response.start_time)
          expect(event.end_time).to    eq(event_response.end_time)
          expect(event.place).to       eq(event_response.place)
          expect(event.address).to     eq(event_response.address)
          expect(event.city).to        eq(event_response.city)
          expect(event.state).to       eq(event_response.state)
          expect(event.brewery_id).to  eq(event_response.brewery_id)
        end
      end
    end

    it "does not return all events created more than 24 hours prior" do
      new_events_response = Event.new_events

      expect(new_events_response.include?(@events[4])).to     eq(false)
      expect(new_events_response.include?(@events[4])).to_not eq(true)
    end
  end

  describe "current_events" do
    attr_reader :events

    before(:each) do
      event_one   = Fabricate(:event, end_time:(Time.now + 200000).to_s)
      event_two   = Fabricate(:event, end_time:(Time.now + 300000).to_s)
      event_three = Fabricate(:event, end_time:(Time.now + 400000).to_s)
      event_four  = Fabricate(:event, end_time:(Time.now + 500000).to_s)
      event_five  = Fabricate(:event, end_time:(Time.now + 600000).to_s)
      @events = [event_one, event_two, event_three, event_four, event_five]
    end

    it "returns less than 101 events" do
      94.times{Fabricate(:event, name: rand(10000).to_s, end_time:(Time.now + 100000 + rand(100000)).to_s)}

      new_events_response = Event.current_events

      expect(new_events_response.count).to     eq(99)
      expect(new_events_response.count).to_not eq(0)

      2.times{Fabricate(:event, name: rand(1234).to_s, end_time:(Time.now + rand(100000)).to_s)}
      new_events_response = Event.current_events

      expect(new_events_response.count).to     eq(100)
      expect(new_events_response.count).to_not eq(101)
    end

    it "returns valid events" do
      bad_event = event_five  = Fabricate(:event, end_time:(Time.now - 600000).to_s)
      new_events_response     = Event.current_events

      @events.each_with_index do |event, index|
        expect(new_events_response.include?(event)).to     eq(true)
        expect(new_events_response.include?(event)).to_not eq(false)
      end

      expect(new_events_response.include?(bad_event)).to     eq(false)
      expect(new_events_response.include?(bad_event)).to_not eq(true)
    end

    it "returns all current events with correct attributes" do
      new_events_response = Event.new_events.reverse

      @events.each_with_index do |event, index|
        event_response = new_events_response[index]

        expect(event.id).to          eq(event_response.id)
        expect(event.name).to        eq(event_response.name)
        expect(event.cover).to       eq(event_response.cover)
        expect(event.description).to eq(event_response.description)
        expect(event.start_time).to  eq(event_response.start_time)
        expect(event.end_time).to    eq(event_response.end_time)
        expect(event.place).to       eq(event_response.place)
        expect(event.address).to     eq(event_response.address)
        expect(event.city).to        eq(event_response.city)
        expect(event.state).to       eq(event_response.state)
        expect(event.brewery_id).to  eq(event_response.brewery_id)
      end
    end
  end

  # describe "day_events" do
  #   attr_reader :events
  #
  #   before(:each) do
  #     event_one   = Fabricate(:event, start_time:(Time.now - 1).to_s, end_time:(Time.now + 1).to_s)
  #     event_two   = Fabricate(:event, start_time:(Time.now - 1).to_s, end_time:(Time.now + 1).to_s)
  #     event_three = Fabricate(:event, start_time:(Time.now - 1).to_s, end_time:(Time.now + 1).to_s)
  #     event_four  = Fabricate(:event, start_time:(Time.now - 1).to_s, end_time:(Time.now + 1).to_s)
  #     event_five  = Fabricate(:event, start_time:(Time.now - 100000000).to_s, end_time:(Time.now + 100000000).to_s)
  #     @events = [event_one, event_two, event_three, event_four, event_five]
  #   end
  #
  #   it "returns correct number of events" do
  #     new_events_response = Event.day_events
  #     binding.pry
  #     expect(new_events_response.count).to eq(4)
  #   end
  #
  #   it "returns all events starting today and ending after the beginning of the day" do
  #     new_events_response = Event.new_events
  #
  #     @events.each_with_index do |event, index|
  #       unless index == 4
  #         expect(new_events_response.include?(event)).to eq(true)
  #         expect(new_events_response.include?(event)).to_not eq(false)
  #       end
  #     end
  #   end
  #
  #   it "returns all events starting today and ending after the beginning of the day with correct attributes" do
  #     new_events_response = Event.new_events.reverse
  #
  #     @events.each_with_index do |event, index|
  #       unless index == 4
  #         event_response = new_events_response[index]
  #
  #         expect(event.id).to eq(event_response.id)
  #         expect(event.name).to eq(event_response.name)
  #         expect(event.cover).to eq(event_response.cover)
  #         expect(event.description).to eq(event_response.description)
  #         expect(event.start_time).to eq(event_response.start_time)
  #         expect(event.end_time).to eq(event_response.end_time)
  #         expect(event.place).to eq(event_response.place)
  #         expect(event.address).to eq(event_response.address)
  #         expect(event.city).to eq(event_response.city)
  #         expect(event.state).to eq(event_response.state)
  #         expect(event.brewery_id).to eq(event_response.brewery_id)
  #       end
  #     end
  #   end
  # end
  describe "modified_date_events" do
    attr_reader :events

    before(:each) do
      event_one   = Fabricate(:event, start_time:(Time.now - 100000).to_s, end_time:(Time.now + 10000).to_s)
      event_two   = Fabricate(:event, start_time:(Time.now - 200000).to_s, end_time:(Time.now + 20000).to_s)
      event_three = Fabricate(:event, start_time:(Time.now - 300000).to_s, end_time:(Time.now + 30000).to_s)
      event_four  = Fabricate(:event, start_time:(Time.now - 400000).to_s, end_time:(Time.now + 40000).to_s)
      event_five  = Fabricate(:event, start_time:(Time.now + 100000000).to_s, end_time:(Time.now + 200000000).to_s)
      @events = [event_one, event_two, event_three, event_four, event_five]
    end

    it "returns correct number of events" do
      new_events_response = Event.modified_date_events(Time.now.to_i)

      expect(new_events_response.count).to eq(4)
    end

    it "returns all events starting today and ending after the beginning of the day" do
      new_events_response = Event.modified_date_events(Time.now.to_i)

      @events.each_with_index do |event, index|
        unless index == 4
          expect(new_events_response.include?(event)).to eq(true)
          expect(new_events_response.include?(event)).to_not eq(false)
        end
      end
    end

    it "returns all events starting today and ending after the beginning of the day with correct attributes" do
      new_events_response = Event.modified_date_events(Time.now.to_i)

      @events.each_with_index do |event, index|
        unless index == 4
          event_response = new_events_response[index]

          expect(event.id).to          eq(event_response.id)
          expect(event.name).to        eq(event_response.name)
          expect(event.cover).to       eq(event_response.cover)
          expect(event.description).to eq(event_response.description)
          expect(event.start_time).to  eq(event_response.start_time)
          expect(event.end_time).to    eq(event_response.end_time)
          expect(event.place).to       eq(event_response.place)
          expect(event.address).to     eq(event_response.address)
          expect(event.city).to        eq(event_response.city)
          expect(event.state).to       eq(event_response.state)
          expect(event.brewery_id).to  eq(event_response.brewery_id)
        end
      end
    end
  end

  describe "get_event" do
    attr_reader :events

    before(:each) do
      event_one   = Fabricate(:event, id:1, start_time:(Time.now - 100000).to_s, end_time:(Time.now + 10000).to_s)
      event_two   = Fabricate(:event, id:2, start_time:(Time.now - 200000).to_s, end_time:(Time.now + 20000).to_s)
      event_three = Fabricate(:event, id:3, start_time:(Time.now - 300000).to_s, end_time:(Time.now + 30000).to_s)
      event_four  = Fabricate(:event, id:4, start_time:(Time.now - 400000).to_s, end_time:(Time.now + 40000).to_s)
      event_five  = Fabricate(:event, id:5, start_time:(Time.now + 100000000).to_s, end_time:(Time.now + 200000000).to_s)
      @events = [event_one, event_two, event_three, event_four, event_five]
    end

    it "returns correct number of events" do
      new_event_response = [Event.get_event({id:1})]

      expect(new_event_response.count).to     eq(1)
      expect(new_event_response.count).to_not eq(2)
    end

    it "returns the correct event" do
      @events.each do |event|
        new_event_response = [Event.get_event({id:event.id})]

        expect(new_event_response.include?(event)).to     eq(true)
        expect(new_event_response.include?(event)).to_not eq(false)
      end
    end

    it "returns the event with correct attributes" do
      @events.each do |event|
        event_response = Event.get_event({id:event.id})

        expect(event.id).to          eq(event_response.id)
        expect(event.name).to        eq(event_response.name)
        expect(event.cover).to       eq(event_response.cover)
        expect(event.description).to eq(event_response.description)
        expect(event.start_time).to  eq(event_response.start_time)
        expect(event.end_time).to    eq(event_response.end_time)
        expect(event.place).to       eq(event_response.place)
        expect(event.address).to     eq(event_response.address)
        expect(event.city).to        eq(event_response.city)
        expect(event.state).to       eq(event_response.state)
        expect(event.brewery_id).to  eq(event_response.brewery_id)
      end
    end
  end
end
