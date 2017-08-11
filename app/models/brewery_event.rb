class BreweryEvent < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :event
end
