class AddProductPlaceholderToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :product_placeholder, :string, :default => 'Put an example here.'
  end
end
