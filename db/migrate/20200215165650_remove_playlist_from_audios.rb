class RemovePlaylistFromAudios < ActiveRecord::Migration[5.2]
  def change
    remove_reference :audios, :playlist, foreign_key: true
  end
end
