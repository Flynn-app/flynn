class CreateJoinTableAudiosPlaylists < ActiveRecord::Migration[5.2]
  def change
    create_join_table :audios, :playlists do |t|
      t.references :audio, foreign_key: true
      t.references :playlist, foreign_key: true
    end
  end
end
