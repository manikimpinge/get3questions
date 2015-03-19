class RemoveFieldsFromReview < ActiveRecord::Migration
  def up
    remove_column :reviews, :product_question
    remove_column :reviews, :product_placeholder
  end

  def down
  end
end
