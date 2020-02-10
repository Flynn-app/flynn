class AddAudioDurationToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :audio_duration, :string
  end
end
