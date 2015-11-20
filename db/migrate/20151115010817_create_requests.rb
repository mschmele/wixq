class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.string :artist
      t.string :link
      t.string :requested_by
      t.boolean :acknowledged

      t.timestamps null: false
    end
  end
end
