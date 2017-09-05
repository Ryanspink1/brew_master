class Event < ActiveRecord::Base
  has_many :brewery_events
  has_many :breweries, through: :brewery_events
  validates :name,
            :fb_id,
            :cover,
            :address,
            :city,
            :state,
            :start_time,
            :end_time,
            :place,
            :cover,
            :description,
            :created_at,

            presence: true

  validates :fb_id,
            :description,

            uniqueness: true
end
