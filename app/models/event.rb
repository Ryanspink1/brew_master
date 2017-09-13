class Event < ActiveRecord::Base
  has_many :brewery_events
  has_many :breweries, through: :brewery_events
  validates :name,
            :fb_id,
            :cover,
            :description,
            :start_time,
            :end_time,
            :place,
            :address,
            :city,
            :state,
            :brewery_id,

            presence: true

  validates :fb_id,

            uniqueness: true
end
