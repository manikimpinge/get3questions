class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :profile_id
      t.integer :score
      t.boolean :recommendation
      t.text :review

      t.timestamps
    end
  end
end
