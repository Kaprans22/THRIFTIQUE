class AddDetailesToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :status, :boolean, default: false
    add_column :products, :product_photo, :string
    add_column :products, :size, :string
    add_reference :products, :user, foreign_key: true
  end
end
