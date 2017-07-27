class Brewery < ActiveRecord::Base
  validates :name,
            :owner,
            :address,
            :city,
            :state,
            :description,
            :creation_date,
            :url,

            presence: true

  validates :name,
            :owner,
            :description,
            :url,

            uniqueness: true

  validates :url, :url => true
end
