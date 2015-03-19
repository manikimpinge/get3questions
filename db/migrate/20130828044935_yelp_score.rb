class YelpScore < ActiveRecord::Migration
  def change
    add_column :profiles, :yelp_score, :boolean
  end
end
