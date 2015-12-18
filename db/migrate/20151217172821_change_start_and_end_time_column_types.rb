class ChangeStartAndEndTimeColumnTypes < ActiveRecord::Migration
  def change
  	change_column :shows, :start_time, :time
  	change_column :shows, :end_time, :time
  end
end
