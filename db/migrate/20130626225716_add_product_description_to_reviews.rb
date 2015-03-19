class AddProductDescriptionToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :product_description, :string
  end
end
