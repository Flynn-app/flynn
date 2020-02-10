class AddTextImageToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :text_image, :string
  end
end
