class AddProductQuestionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :product_question, :string, :default => 'What product did you purchase?'
  end
end
