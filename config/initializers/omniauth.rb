Rails.application.config.middleware.use OmniAuth::Builder do
  provider :coinbase, ENV['KG7QMt2iWMtdfgS0'], ENV['tuL3RN1hlYZgDBsvEoyUflDOgRU5Xwht']
  #API key and secret from Rose's coinbase sandbox
end