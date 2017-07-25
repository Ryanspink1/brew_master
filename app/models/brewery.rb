class Brewery < ActiveRecord::Base
  validates :name, presence: true

end
