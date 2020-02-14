class AddHtmlToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :text_html, :text
  end
end
