class AddUserBioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_bio, :text
  end
end
