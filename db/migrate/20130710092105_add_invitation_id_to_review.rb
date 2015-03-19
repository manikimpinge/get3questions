class AddInvitationIdToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :invitation_id, :integer
  end
end
