require 'rake'

task :get_new_events => :environment do
  class SeedEvent
    def initialize
      @token = ENV["FACEBOOK_TOKEN"]
    end

    def self.start
      seed = SeedEvent.new
      seed.get_events
    end

    def get_events
      Brewery.all.each do |brewery|
        puts brewery.name
        response = Faraday.get("https://graph.facebook.com/v2.10/#{brewery.fb_id}/events?fields=id%2Ccover%2Cdescription%2Cstart_time%2Cend_time%2Cname%2Cplace&access_token=#{@token}")
        events = JSON.parse(response.body, symbolize_names: true)[:data]
        sanitize_events(brewery, events)
      end
    end

    def sanitize_events(brewery, events)
      sanitized_events = events.each do |event|
        event[:name] = ""                      if event[:id].nil?
        event[:cover] = {:source => ""}        if event[:cover].nil?
        event[:cover][:source] = ""            if event[:cover][:source].nil?
        event[:description] = ""               if event[:description].nil?
        event[:start_time] = ""                if event[:start_time].nil?
        event[:end_time] = ""                  if event[:end_time].nil?
        event[:place] = {:name=>"N/A"}         if event[:place].nil?
        event[:place][:name] = ""              if event[:place][:name].nil?
        event[:place][:location] = {:street=>"", :city => "", :state => ""}          if event[:place][:location].nil?
        event[:place][:location][:street] = "" if event[:place][:location][:street].nil?
        event[:place][:location][:city] = ""   if event[:place][:location][:city].nil?
        event[:place][:location][:state] = ""  if event[:place][:location][:state].nil?
      end
      populate_events(brewery, sanitized_events)
    end

    def populate_events(brewery, events)
      events.each do |event|
        if Event.where(fb_id: event[:id]).exists?
           BreweryEvent.find_or_create_by(brewery_id: brewery.id, event_id: Event.where(fb_id: event[:id]).first.id)
        else
          brewery.events.create(fb_id:       event[:id],
                                name:        event[:name],
                                cover:       event[:cover][:source],
                                description: event[:description],
                                start_time:  event[:start_time],
                                end_time:    event[:end_time],
                                place:       event[:place][:name],
                                address:     event[:place][:location][:street],
                                city:        event[:place][:location][:city],
                                state:       event[:place][:location][:state],
                                brewery_id:  brewery.id.to_s)
        end
       puts "Created #{event[:name]}"
      end
     puts "New event population complete!"
    end
  end
  SeedEvent.start
end
