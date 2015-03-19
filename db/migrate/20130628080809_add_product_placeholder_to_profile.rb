class AddProductPlaceholderToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :product_placeholder, :string, :default => 'Put an example here.'
  end
end
