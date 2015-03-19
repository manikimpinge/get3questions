class ProfilesController < ApplicationController

  before_filter :authenticate_user!, except: [:show]

  expose(:profiles) { Profile.all }
  expose(:profile) { current_user.profile }

  def index
  end

  def show
    self.profile = Profile.find(params[:id])
    @profile_name = Profile.find(params[:id]).business_name
    @profile_page_color = Profile.find(params[:id]).page_color
    @profile_page_header = Profile.find(params[:id]).page_header_file_name
    if params.has_key?('post_id')
      self.profile.reviews.find(params[:review_id]).update_attributes(:user_id => session[:facebook_user_id], :reviewer_first => session[:facebook_user_fname], :reviewer_last => session[:facebook_user_lname])
    end
  end

  def new
    render "edit"
  end

  def edit
  end

  def update
    begin
      if profile.update_attributes(params[:profile])
        redirect_to profile, notice: t("profiles.update.success", url: new_invitation_url)
      else
        render action: "edit"
      end
    rescue
      flash[:alert] = "Something went wrong"
      redirect_to root_url
    end
  end

  def destroy
    profile.destroy
    redirect_to profiles_url
  end

  def image_previews
    render layout: false
  end

  def save_product_question
    @profile = Profile.find(params[:id])
    @profile.update_attributes(:product_question => params[:label], :product_placeholder => params[:placeholder])
    render :text => "ok"
 end

  def save_page_header
    @profile = Profile.find(params[:id])
    @profile.update_attributes(params[:profile])
    redirect_to :back
  end

  def save_page_color
    @profile = Profile.find(params[:id])
    @profile.update_attribute('page_color', params[:color])
    render :text => "ok"
  end

  def delete_image
    @profile = Profile.find(params[:id])
    if params[:delete_column] == "page_header"
      @profile.page_header.destroy
    else
      @profile.image.destroy
    end
    @profile.save
    render :text => "ok"
  end

  def add_review_site
    @profile = Profile.find(params[:id])
    @profile.update_attributes(:review_name => params[:review_name], :review_link => params[:review_link])
    render :text => "ok"
  end

  def follow_up_email
   current_user.update_attribute('follow_up_email', params[:status])
   render :text => "ok"
  end
 
  def resend_email
   current_user.update_attribute('second_email_request', params[:status])
   render :text => "ok"
  end
 
  def yelp_score
   current_user.profile.update_attribute('yelp_score', params[:status])
   render :text => "ok"
  end
  
  def yelp_score_value
   current_user.profile.update_attribute('yelp_score_value', params[:value])
   render :text => "ok"
  end
 
end
