class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def after_sign_in_path_for(user)
    if user.profile.present?
      new_invitation_url
    else
      new_profile_path
    end
  end

  def authenticate_active_admin_user!
    authenticate_user! 
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path 
    end
  end

end
