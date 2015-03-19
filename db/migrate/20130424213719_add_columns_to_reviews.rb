class AddColumnsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :contact, :boolean
    add_column :reviews, :reviewer_first, :string
    add_column :reviews, :reviewer_last, :string
  end
end
