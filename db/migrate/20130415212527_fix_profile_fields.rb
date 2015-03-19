class FixProfileFields < ActiveRecord::Migration
  
  def up
	rename_column :profiles, :Business_Name, :business_name
	rename_column :profiles, :Address, :address
	rename_column :profiles, :City, :city
	rename_column :profiles, :State, :state
	rename_column :profiles, :Zip, :zip
	rename_column :profiles, :Phone, :phone
  end
  def down
	  #do nothing
  end
end
