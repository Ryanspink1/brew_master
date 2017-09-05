class CreateBreweryEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :brewery_events do |t|
      t.references :brewery, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
