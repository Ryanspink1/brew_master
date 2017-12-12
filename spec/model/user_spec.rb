require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:zip_code)}

    it { should validate_uniqueness_of(:email)}
  end

  context "relationships" do
    it { should have_many(:events) }
    it { should have_many(:user_events) }
    it { should have_many(:breweries)}
    it { should have_many(:favorites)}

  end

  describe "event_index" do
    it "returns users events" do
      event_one       = Fabricate(:event, id:1, start_time: (Time.now + 10000))
      event_two       = Fabricate(:event, id:2, start_time: (Time.now + 20000))
      event_three     = Fabricate(:event, id:3, start_time: (Time.now + 30000))
      current_user    = Fabricate(:user)
      events          = [event_one, event_two, event_three]

      events.each do |event|
        UserEvent.create(user_id:current_user.id, event_id:event.id)
      end

      event_index_response = current_user.event_index

      event_index_response.each_with_index do |event, index|
        expect(event.name).to        eq(events[index].name)
        expect(event.fb_id).to       eq(events[index].fb_id)
        expect(event.cover).to       eq(events[index].cover)
        expect(event.description).to eq(events[index].description)
        expect(event.start_time).to  eq(events[index].start_time)
        expect(event.end_time).to    eq(events[index].end_time)
        expect(event.place).to       eq(events[index].place)
        expect(event.city).to        eq(events[index].city)
        expect(event.address).to     eq(events[index].address)
        expect(event.state).to       eq(events[index].state)
        expect(event.brewery_id).to  eq(events[index].brewery_id)

        indexes = [0,1,2]
        indexes.delete(index)
        index = indexes.sample
        
        expect(event.name).to_not        eq(events[index].name)
        expect(event.fb_id).to_not       eq(events[index].fb_id)
        expect(event.cover).to_not       eq(events[index].cover)
        expect(event.description).to_not eq(events[index].description)
        expect(event.start_time).to_not  eq(events[index].start_time)
        expect(event.end_time).to_not    eq(events[index].end_time)
        expect(event.place).to_not       eq(events[index].place)
        expect(event.city).to_not        eq(events[index].city)
        expect(event.address).to_not     eq(events[index].address)
        expect(event.state).to_not       eq(events[index].state)
        expect(event.brewery_id).to_not  eq(events[index].brewery_id)
      end
    end
  end
end
