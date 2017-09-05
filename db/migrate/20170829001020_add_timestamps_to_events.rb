class AddTimestampsToEvents < ActiveRecord::Migration[5.0]
  def change
    change_table :events do |t|
      t.timestamps
    end
  end
end
