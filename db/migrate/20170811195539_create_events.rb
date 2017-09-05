class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :fb_id
      t.string :name
      t.string :cover
      t.text   :description
      t.string :start_time
      t.string :end_time
      t.string :place
      t.string :address
      t.string :city
      t.string :state
    end
  end
end
