class YelpScoreValue < ActiveRecord::Migration
  def change
    add_column :profiles, :yelp_score_value, :string
  end

end
