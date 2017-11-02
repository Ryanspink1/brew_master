class AddZipCodeToBrewery < ActiveRecord::Migration[5.0]
  def change
    add_column :breweries, :zip_code, :string
  end
end
