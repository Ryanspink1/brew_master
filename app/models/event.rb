class Event < ActiveRecord::Base
  has_many :brewery_events
  has_many :breweries, through: :brewery_events
end
