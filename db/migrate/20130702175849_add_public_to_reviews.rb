class AddPublicToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :public, :boolean
  end
end
