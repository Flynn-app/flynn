class AddPlaylistToAudios < ActiveRecord::Migration[5.2]
  def change
    add_reference :audios, :playlist, foreign_key: true
  end
end
