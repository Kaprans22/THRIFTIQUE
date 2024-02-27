class RemovePhotoUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :user_photo, :string
    
  end
end
