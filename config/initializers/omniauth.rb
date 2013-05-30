Rails.application.config.middleware.use OmniAuth::Builder do
  amazon_client_id = ENV['AMAZON_CLIENT_ID']
  amazon_client_secret = ENV['AMAZON_CLIENT_SECRET']
  provider :amazon, amazon_client_id, amazon_client_secret
end
