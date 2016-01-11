class AddIsAdminToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :is_admin, :bool
  end
end
