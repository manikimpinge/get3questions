module InvitationsHelper

  def options_for_invitation_medium
    [
      [ "Invite via Email", "email" ],
      [ "Invite via Phone", "phone" ]
    ]
  end

end
