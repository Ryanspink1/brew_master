task :seed_events do
  class Seed
    def self.start
      seed = Seed.new
      seed.get_events
    end

    def get_events
      byebug
      Brewery.all.each do |brewery|
        response = Faraday.get"https://graph.facebook.com/v2.10/#{brewery.id}/events?fields=id%2Ccover%2Cdescription%2Cstart_time%2Cend_time%2Cname%2Cplace&access_token=EAACEdEose0cBADA93Lj6Bptyufabr0Ji6BSC4TQrXZAcrsgr8MAlhxk7HZBYU3WSzwM6Gk8WV3A28SnQIRGFTlrZABWzMDnq4hizxEZCCComVqRdKbZCqzWOFWUCC7UEpsh36oUwHqxkok6J6nktgrjmxIsW5RdDviFhPl83Rg71RZCW7282ZBk8mz0fZA6OyHkZD"
        parsed = JSON.parse(response.body, symbolize_names: true)
        events = parsed[:data]
        populate_events(brewery, events)
      end
    end

    def populate_events(brewery, events)
      events.each do |event|
        binding.pry
        brewery.event.find_or_create_by(fb_id:       event[:id],
                                        cover:       event[:cover][:source],
                                        description: event[:description],
                                        start_time:  event[:start_time],
                                        end_time:    event[:end_time],
                                        place:       event[:place][:name],
                                        address:     event[:place][:loction][:street],
                                        city:        event[:place][:location][:city],
                                        state:       event[:place][:location][:state])
      end
    end
  end
  Seed.start
end
