class InvitationsController < ApplicationController

  before_filter :authenticate_user!

  expose(:invitations) { current_user.invitations }
  expose :invitation

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if invitation.valid?
      invitation.save!
      invitation.destroy unless send_invitation(invitation)
      redirect_to new_invitation_url, notice: t("invitations.create.success")
    else
      render "new"
    end
  end

  def update
    if invitation.save
      redirect_to invitation, notice: t("invitations.update.success")
    else
      render "edit"
    end
  end

  def destroy
    invitation.destroy
    redirect_to invitations_url
  end

  private

  def send_invitation(invitation)
    UserMailer.invitation_email(invitation).deliver and return true if invitation.medium_email?
    send_invitation_sms(invitation) if invitation.medium_phone?
  end

  def send_invitation_sms(invitation)
    begin
      TwilioGateway.new.send_sms(
        from: Settings.twilio_outgoing_no,
        to: invitation.phone_with_country_code,
        body: "#{invitation.user.profile.business_name} invites you to provide feedback - #{new_profile_review_url(invitation.user.profile)}"
      )
    rescue Twilio::REST::RequestError => e
      invitation.errors[:phone] << "is not a valid Phone number"
      return false
    end
    true
  end

end
