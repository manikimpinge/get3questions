class AddProfileIdToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :profile_id, :integer
  end
end
