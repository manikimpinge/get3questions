Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    Settings.fb_app_id,
    Settings.fb_secret,
    scope: "publish_stream",
    display: "popup"
end
