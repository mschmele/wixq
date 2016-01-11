class AddPasswordDigestToDJsTable < ActiveRecord::Migration
  def change
    add_column :djs, :password_digest, :string
  end
end
