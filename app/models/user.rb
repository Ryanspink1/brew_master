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
end
