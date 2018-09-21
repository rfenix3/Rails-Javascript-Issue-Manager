Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'Client_ID', 'Client_Secret'
end
  
