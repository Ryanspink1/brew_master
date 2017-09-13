class AddBreweryIdToEvents < ActiveRecord::Migration[5.0]
  def change
      add_column :events, :brewery_id, :string
  end
end
