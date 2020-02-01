class AddTitleToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :title, :string
  end
end
