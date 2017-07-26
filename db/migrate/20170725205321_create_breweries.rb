class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :owner
      t.string :address
      t.string :city
      t.string :state
      t.text :description
      t.date :creation_date
      t.string :url

      t.timestamps
    end
  end
end
