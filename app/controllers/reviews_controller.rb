class ReviewsController < ApplicationController

  include AssetUrlHelper

  expose :profile
  expose(:reviews) { profile.reviews }
  expose :review

  def index
  end

  def show
  end

  def new
    @profile_page_color = profile.page_color
    @profile_page_header = profile.page_header_file_name
  end

  def edit
  end

  def create
    if review.save
      review.update_attribute('invitation_id', params[:invitation_id]) if review.sharable?
      review.invitation.update_attribute('send_email', false) if review.sharable? && !params[:invitation_id].blank? && review.profile.review_link !="" && review.profile.review_name != "" && review.profile.user.follow_up_email == true
      profile_path = profile_url(params[:profile_id])
      UserMailer.review_email(review,profile_path).deliver
      flash[:notice] = t("reviews.create.success")
      if review.sharable? && params[:fb_share].present?
        session[:redirect_to] = review_share_url
        session[:onerror_redirect_to] = profile_url(profile)
        redirect_to connect_to_facebook_url
      end
      redirect_to [ profile ] unless params[:fb_share].present?
    else
      render action: "new"
    end
  end

  def update
    if review.save
      redirect_to review_share_url and return if review.sharable? && params[:fb_share].present?
      redirect_to [ profile ]
    else
      render action: "edit"
    end
  end

  def destroy
    review.destroy
    redirect_to profile_reviews_path(profile)
  end

  def on_off_product_question
   current_user.update_attribute('product_description', params[:status])
   render :text => "ok"
  end

  private

  def review_share_url
    name =         "#{review.reviewer_first} gives #{review.profile.business_name} #{review.score} out of 5 stars."
    page_link =    profile_review_url(review.profile, review)
    caption =     "#{review.profile.description} | #{review.profile.city}, #{review.profile.state}"
    description =  review.review || "N.A."
    picture_url =  review.profile.image.url

    url = "https://www.facebook.com/dialog/feed?app_id=#{Settings.fb_app_id}&"\
    "link=#{page_link}&"\
    "picture=#{picture_url}&"\
    "name=#{name}&"\
    "caption=#{caption}&"\
    "description=#{description}&"\
    "redirect_uri=#{profile_url(profile)}?review_id=#{review.id}&"\
    "display=page"

    URI.encode(url)
  end

end
