class AddProductDescriptionToUser < ActiveRecord::Migration
  def change
    add_column :users, :product_description, :string, :default => "off"
  end
end
