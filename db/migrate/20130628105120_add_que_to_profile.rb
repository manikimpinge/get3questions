class AddQueToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :product_question, :string, :default => 'What product did you purchase?'
  end

  def down
  end
end
