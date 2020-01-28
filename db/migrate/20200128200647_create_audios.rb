class CreateAudios < ActiveRecord::Migration[5.2]
  def change
    create_table :audios do |t|
      t.text :url
      t.string :language
      t.text :text_to_transcript
      t.text :audio_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
