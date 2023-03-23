Yt.configure do |config|
  config.client_id     = Rails.application.credentials.youtube_client_id
  config.client_secret = Rails.application.credentials.youtube_client_secret

  config.log_level = :debug
end
