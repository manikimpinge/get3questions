class RemoveQuePlaceholderFromProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :product_question
    remove_column :profiles, :product_placeholder
  end

  def down
  end
end
