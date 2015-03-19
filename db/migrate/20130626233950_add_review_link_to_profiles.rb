class AddReviewLinkToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :review_link, :string
  end
end
