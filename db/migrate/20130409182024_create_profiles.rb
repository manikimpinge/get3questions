class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :Business_Name
      t.text :Address
      t.text :City
      t.text :State
      t.text :Zip
      t.text :Phone

      t.timestamps
    end
  end
end
