class User < ApplicationRecord
  has_secure_password
  has_many :user_events
  has_many :events, through: :user_events
  has_many :favorites
  has_many :breweries, through: :favorites
  validates :email,
            :first_name,
            :last_name,
            :zip_code,

            presence: true

  enum role:[:default, :admin]

  validates :email,

            uniqueness: true

  def event_index
    events.where("end_time > ?", Time.now).order(:start_time)
  end

  def favorite_breweries
    breweries.order(:name)
  end

  # def favorites_events
  #   # brewery_ids = breweries.pluck(:id)
  #    brewery_ids = User.find(4).breweries.pluck(:id)
  #   events = Event
  #   .includes(:breweries)
  #   .where(brewery_id:brewery_ids)
  #   return {events: events.first.breweries}
  #   rescue
  #     return {"hello": "whatchu"}
  # end

  def get_favorites_ids
    breweries
    .order(:name)
    .pluck(:id)
    .join(", ")
  end

  def favorites_events
    brewery_ids = User.find(4).get_favorites_ids ||=0
    Rails.cache.fetch("user:#{id},breweries:#{brewery_ids}", expires_in: 10.minutes) do
      response = PostgresConnection.new.raw_sql(
        "
         SELECT events.name as event_name, breweries.name as brewery_name, events.id as event_id, events.start_time, events.end_time, brewery_events.brewery_id
          FROM events
         INNER JOIN brewery_events
           ON events.id  = brewery_events.event_id
         INNER JOIN breweries
           ON brewery_events.brewery_id = breweries.id
         WHERE breweries.id in (#{brewery_ids})
         AND events.end_time > '#{Time.now.to_s(:db)}'
         ORDER BY events.start_time
        ")
        .to_a
        .group_by{|event|event["brewery_name"]}
        .sort
        .to_h
      response
    end
  end
end
