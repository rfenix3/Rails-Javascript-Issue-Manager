Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'CLIENT_ID', 'CLIENT_SECRET'
end
  
