class StaticPagesController < ApplicationController
  def home
    @profile = current_user.profile if user_signed_in?
	  render home_view
  end

  def about
  end

  def facebook
  end

  def widgetsamples
  end

  def whyreviews
  end

  def resourcesforwebdesigners
  end

  def local_search_report
  end  

  def pricing
  end

  def get_payment
    @account = current_user
  end

  def verify_payment
    begin
      @account = current_user
      Stripe.api_key = Settings[:stripe_api_key]
      plan = params[:account_type]=="premium" ? Settings[:stripe_plan_49] : Settings[:stripe_plan_99]
      card_token = Stripe::Token.create( :card => { :name => params[:name_on_card], :number => params[:card_number], :exp_month => params[:exp_month], :exp_year => params[:exp_year], :cvc => params[:card_id] })
      customer_params = {:card => card_token[:id], :plan => plan, :email => @account.email}
      customer_params[:coupon] = params[:stripe_coupon] unless params[:stripe_coupon].blank?
      stripe_customer = Stripe::Customer.create(customer_params)
      if @account.update_attributes(:customer_id => stripe_customer[:id], :user_account_type => params[:account_type])
        flash[:notice] = "Payment is successful."
        redirect_to root_url
      else
        redirect_to root_url 
      end
    rescue Exception => e
      flash[:alert] = "#{e.message}"
      redirect_to root_url
    end
  end

   def iframe_box
    @profile = Profile.find(params[:id])
    @data = @profile.reviews.reverse
    @profile_page_header = ""
    @transparent = "transparent"
  end
  
  def contact_us_query
    content = params[:feedback]
    UserMailer.contact_us(content).deliver
    render :json => {:status => "ok"}.to_json
  end

private
	def home_view
		user_signed_in? ? "home_signed_in" : "home"
	end

end
