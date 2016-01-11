class AddIsDefaultPasswordToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :is_default_password, :boolean, :default => true
  end
end
