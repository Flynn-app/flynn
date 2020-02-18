class AddIdToAudiosPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :audios_playlists, :id, :primary_key
  end
end
