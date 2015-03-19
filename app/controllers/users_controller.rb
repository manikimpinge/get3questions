class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome Email after save
        UserMailer.welcome_email(@user).deliver
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def get_fb_token
    if params[:code]
       session[:access_token] = session[:oauth].get_access_token(params[:code])
       @api = Koala::Facebook::API.new(session[:access_token])
       session[:facebook_user_id] = @api.get_object('me')['id']
       session[:facebook_user_fname] = @api.get_object('me')['first_name']
       session[:facebook_user_lname] = @api.get_object('me')['last_name']
       redirect_to session[:redirect_to]
     else
       redirect_to session.has_key?('onerror_redirect_to') ? session[:onerror_redirect_to]: root_url
    end
  end
  
  def connect_to_facebook
    session[:oauth] = Koala::Facebook::OAuth.new(Settings.fb_app_id,Settings.fb_secret,"#{request.protocol}#{request.host}/get_fb_token/")
    redirect_to session[:oauth].url_for_oauth_code()
  end

end
