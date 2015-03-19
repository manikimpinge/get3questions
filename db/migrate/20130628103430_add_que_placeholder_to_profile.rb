class AddQuePlaceholderToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :product_question, :string, :default => 'What product did you purchase?'
    add_column :profiles, :product_placeholder, :string, :default => 'Put an example here.'
  end

  def down
  end
end
