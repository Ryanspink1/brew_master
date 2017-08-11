class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :fb_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.text :about
      t.string :photo
      t.text :description
      t.string :founded
      t.string :url

      t.timestamps
    end
  end
end
