class BreweryEvent < ApplicationRecord
  belongs_to :brewery
  belongs_to :event
end
