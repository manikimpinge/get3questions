class ChangeDatatypeToText < ActiveRecord::Migration
  def self.up
   change_column :profiles, :description, :text
  end

  def self.down
   change_column :profiles, :description, :string
  end
end
