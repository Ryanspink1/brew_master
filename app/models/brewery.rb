class Brewery < ActiveRecord::Base
  has_many :brewery_events
  has_many :events, through: :brewery_events
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
end
