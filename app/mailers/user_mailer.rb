class UserMailer < ActionMailer::Base

  layout "email"

  default from: Settings.from_email

  def invitation_email(invitation)
    @invitation = invitation
    mail :to => invitation.email, :subject => "How did we do?", :from => invitation.user.email
  end

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome!")
  end

  def review_email(review, profile_path)
    @review = review
    @profile_path = profile_path
    mail(to: review.profile.user.email, subject: "You've got a new review.")
  end

  def invitee_email(invitation)
    @invitation = invitation
    mail(to: invitation.email, subject: "Thank you for the feedback.", from: invitation.user.email)
  end
  
  def review_second_email(invitation)
    @invitation = invitation
    mail(to: invitation.email, subject: "Thank you for the feedback.", from: invitation.user.email)
  end
  
  def contact_us(content)
    @content = content[:message]
    @email = content[:email_address]
    mail(to: "info@get3questions.com", subject: "New **Contact Us** message from "+@email, from: @email)
  end
end
