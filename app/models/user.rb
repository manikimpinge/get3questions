class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :first_name, :last_name, :phone_number, :admin, :user_account_type, :customer_id

  has_one :profile

  has_many :invitations


end
