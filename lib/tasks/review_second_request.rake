task :review_second_request => :environment do
  invitations = Invitation.find(:all, :conditions => ["send_email IS true and second_email IS false" ])
  invitations.each do |invitation|
    if invitation.review.nil? && invitation.user.second_email_request
      if (((Time.now - invitation.created_at) / 1.days).round == Settings.review_second_request_days)
        UserMailer.review_second_email(invitation).deliver
        invitation.update_attribute('second_email', true)
      end
    end
  end
end