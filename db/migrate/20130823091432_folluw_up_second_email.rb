class FolluwUpSecondEmail < ActiveRecord::Migration
  def change
    add_column :invitations, :second_email, :boolean, :default => false
  end
end
