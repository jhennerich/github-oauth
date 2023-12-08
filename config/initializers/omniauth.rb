Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  provider :google_oauth2, ENV['google_client_id'], ENV['google_client_secret']
end