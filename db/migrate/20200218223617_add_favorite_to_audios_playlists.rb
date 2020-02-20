class AddFavoriteToAudiosPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :audios_playlists, :favorite, :boolean
  end
end
