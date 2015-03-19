class AddReviewNameToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :review_name, :string
  end
end
