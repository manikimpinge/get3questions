class AddMediumToInvitations < ActiveRecord::Migration

  def change
    add_column :invitations, :medium, :string
  end

end
