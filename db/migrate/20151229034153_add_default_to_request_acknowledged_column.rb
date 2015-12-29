class AddDefaultToRequestAcknowledgedColumn < ActiveRecord::Migration
  def change
    change_column :requests, :acknowledged, :boolean, :default => false
  end
end
