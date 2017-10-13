class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  has_many :favorites
  has_many :breweries, through: :favorites
  validates :email,
            :first_name,
            :last_name,
            :zip_code, presence: true
  enum role:[:default, :admin]

  validates :email, uniqueness: true
end
