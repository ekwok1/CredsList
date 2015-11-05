class User < ActiveRecord::Base

  #for omniauth
  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth['uid']
  #     if auth['info']
  #       # user.name = auth["user_info"]["name"]
  #     user.name = auth['info']['name'] || ""
  #     user.email = auth['info']['email'] || ""
  #     end
  #   end
  # end

  # def create_client
  #   @tokens = {
  #     access_token: access_token,
  #     refresh_token: refresh_token,
  #     expires_at: Time.now + 2.hours
  #   }

  #   # client = Coinbase::OAuthClient.new(ENV['e241d96b92c48a72178566b775981268f6c5afce2c10fa95f7141092effa262f'], ENV['269d9da7a2fccf7847cc8787daf0d0b31f4447bc671d267660f16abb24bf5c77'], @tokens)
  #   # client = Coinbase::Wallet::Client.new(api_key: KG7QMt2iWMtdfgS0, api_secret: tuL3RN1hlYZgDBsvEoyUflDOgRU5Xwht api_url: "https://api.sandbox.coinbase.com")
  # end

  # def update_credentials(client)
  #   new_client = client.refresh!
  #   update(access_token: new_client.token, refresh_token: new_client.refresh_token)

  #   self
  # end

  # validates :email, :first_name, :last_name, presence: true
  # validates :email, uniqueness: true

  # has_secure_password

  # has_many :items
  # has_many :txns

  # def generate_password_reset_token!
  #   update(password_reset_token: SecureRandom.urlsafe_base64(48))
  # end
  
end