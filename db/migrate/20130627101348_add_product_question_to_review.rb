class AddProductQuestionToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :product_question, :string, :default => 'What product did you purchase?'
  end
end
