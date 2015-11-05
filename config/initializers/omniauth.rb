Rails.application.config.middleware.use OmniAuth::Builder do
  provider :coinbase, ENV['COINBASE_CLIENT_ID'], ENV['COINBASE_CLIENT_SECRET'], scope: 'wallet:user:read', sandbox: true
  #API key and secret from Rose's coinbase sandbox
end