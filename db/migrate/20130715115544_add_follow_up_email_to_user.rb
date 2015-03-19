class AddFollowUpEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :follow_up_email, :boolean
  end
end
