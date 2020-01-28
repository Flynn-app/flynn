class ChangeUrlToAudio < ActiveRecord::Migration[5.2]
  def change
    rename_column :audios, :url, :text_url
  end
end
