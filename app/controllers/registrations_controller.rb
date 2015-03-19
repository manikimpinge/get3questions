class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      @user.build_profile.save!(validate: false)
      UserMailer.welcome_email(@user).deliver
    end
  end

  protected

  def after_sign_up_path_for(user)
    flash[:notice] = t("registrations.create.success")
    new_profile_url
  end

end
