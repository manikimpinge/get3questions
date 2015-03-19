class FacebookSessionsController < ActionController::Base

  def create
    cookies[:current_oauth_token] = { value: request.env["omniauth.auth"]["credentials"]["token"], expires: 1.hour.from_now }
  end

  def failure
    redirect_to reviews_url
  end

end
