class AddAccoutTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_account_type, :string, :default => "free"
  end
end
