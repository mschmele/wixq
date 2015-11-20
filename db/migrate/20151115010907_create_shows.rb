class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :day_of_week

      t.timestamps null: false
    end
  end
end
