module AssetUrlHelper

  def asset_url(asset)
    asset_host = ActionController::Base.asset_host
    if asset_host.present?
      "http:#{asset_host}#{ActionController::Base.helpers.asset_path(asset)}"
    else
      path = ActionController::Base.helpers.asset_path(asset)
      "#{request.protocol}#{request.host_with_port}#{path}"
    end
  end

end
