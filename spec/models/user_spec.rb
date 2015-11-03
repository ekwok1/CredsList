require 'rails_helper'

describe User do

  [:email, :password, :password_digest, :profilepic_url].each do |prop|
    it { should respond_to prop }
  end

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  it { should have_secure_password }

  it { should have_many :items }
  it { should have_many :txns }

end
