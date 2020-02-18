class AddPlaylistImageToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :playlist_image, :string
  end
end
