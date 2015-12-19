class AddBioToDJs < ActiveRecord::Migration
  def change
    add_column :djs, :bio, :text
  end
end
