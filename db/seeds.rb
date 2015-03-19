# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env == 'staging'
  user = User.create(:email => 'admin@admin.com',:password => 12345678, :password_confirmation => 12345678,:first_name => 'admin', :last_name => 'admin', :admin => true)
  user.build_profile(:user_id => user.id,:address => 'admin_profile', :business_name => 'admin_business', :city => 'admin_city', :phone => 'admin_phone', :state => 'admin_state', :zip => 'admin_zip', :description => 'admin_description')
  user.save
end