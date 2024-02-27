class RemovePhotoProduct < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :product_photo, :string
  end
end
