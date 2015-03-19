class WidgetsController < ActionController::Base

  expose(:profile)

  def detail
  end

  def summary
  end

  def iframe_box
    @data = Profile.find(params[:profile_id]).reviews
    @profile_page_header = ""
    @transparent = "transparent"
  end

end
