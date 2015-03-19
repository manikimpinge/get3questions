task :send_invitation_email => :environment do
  invitations = Invitation.find(:all, :conditions => ["send_email IS false" ])
  invitations.each do |invitation|
    if (((Time.now - invitation.created_at) / 1.hour).round >= Settings.email_hours)
      UserMailer.invitee_email(invitation).deliver
      invitation.update_attribute('send_email', true)
    end
  end
end