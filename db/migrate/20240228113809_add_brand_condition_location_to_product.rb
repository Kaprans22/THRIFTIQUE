class AddBrandConditionLocationToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :brand, :string
    add_column :products, :condition, :string
    add_column :products, :location, :string
  end
end
