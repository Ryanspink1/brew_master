class Brewery < ApplicationRecord
  has_many :brewery_events
  has_many :events, through: :brewery_events
  has_many :favorites
  has_many :users, through: :favorites
  validates :name,
            :fb_id,
            :phone,
            :email,
            :address,
            :city,
            :state,
            :about,
            :photo,
            :founded,
            :description,
            :url,

            presence: true

  validates :name,
            :fb_id,
            :description,
            :url,

            uniqueness: true
  #
  # validates :url, :url => true

  def self.get_breweries
    all.order(:name)
  end
end
