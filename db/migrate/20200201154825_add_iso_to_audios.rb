class AddIsoToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :iso, :string
  end
end
