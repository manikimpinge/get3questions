class AddSendEmailToInvitation < ActiveRecord::Migration
  def change
  add_column :invitations, :send_email, :boolean, :default => true
  end
end
