class AddEMailtoDjs < ActiveRecord::Migration
  def change
    add_column :djs, :email, :string
  end
end
