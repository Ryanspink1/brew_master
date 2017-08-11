class Brewery < ActiveRecord::Base
  has_many :brewery_events
  has_many :events, through: :brewery_events
  # validates :name,
  #           :phone,
  #           :email,
  #           :address,
  #           :city,
  #           :state,
  #           :about,
  #           :photo,
  #           :description,
  #           :creation_date,
  #           :founded,
  #           :url,
  #
  #           presence: true

  # validates :name,
  #           :description,
  #           :url,
  #
  #           uniqueness: true
  #
  # validates :url, :url => true
end
