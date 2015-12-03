class AddShowsToDJs < ActiveRecord::Migration
  def change
  	add_reference :djs, :show, index:true
  	add_foreign_key :djs, :show
  end
end
