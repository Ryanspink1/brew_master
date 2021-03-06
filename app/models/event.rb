class Event < ApplicationRecord
  has_many :brewery_events
  has_many :breweries, through: :brewery_events
  has_many :user_events
  has_many :users, through: :user_events
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






  def self.new_events
    where('created_at > ? AND end_time > ?', Time.now - 24.hours, Time.now).limit(100).reverse
  end

  def self.current_events
    where("end_time > ?", Time.now).order(:end_time).limit(100)
  end

  def self.day_events
    Event.where('start_time < ? AND end_time > ?',Date.parse(Time.now.end_of_day.to_s), Date.parse(Time.now.beginning_of_day.to_s)).order(:end_time)
  end

  def self.modified_date_events(date)
    Event.where('start_time < ? AND end_time > ?',Time.at(date.to_f).end_of_day, Time.at(date.to_f).beginning_of_day).order(:end_time)
  end

  def self.get_event(params)
    find(params[:id])
  end
end
