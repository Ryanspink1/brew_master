require 'rails_helper'
require 'pry'

describe 'new_events' do
  it 'returns list of events created in past 24 hours' do
    VCR.use_cassette("events/new_events") do
      new_events = Faraday.get("http://localhost:3000/api/v1/events/new_events")


      parsed_events = JSON.parse(new_events.body)
      expect(parsed_events.count).to eq(25)

      first_event = parsed_events.first
      expect(first_event["id"]).to eq(32091)
      expect(first_event["id"]).to_not eq(32092)

      expect(first_event["name"]).to eq("Football Sunday at Evergeen Brewery & Taphouse")
      expect(first_event["name"]).to_not eq("Fooseball")
    end
  end
end
