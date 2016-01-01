class AddSongToShowRelationship < ActiveRecord::Migration
  def change
    add_reference :songs, :show, index: true
  end
end
