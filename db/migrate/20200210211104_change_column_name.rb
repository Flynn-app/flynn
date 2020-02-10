class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :audios, :audio_duration, :duration
  end
end
