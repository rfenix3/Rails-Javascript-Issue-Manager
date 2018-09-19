Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'CLIEND_ID', 'CLIENT_SECRET'
end
  
