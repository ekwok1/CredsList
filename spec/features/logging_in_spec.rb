require 'rails_helper'

feature 'Logging in a user' do
  
  background do
    visit root_path
  end

  scenario 'Logging in with no username and no password' do
  end

  scenario 'Logging in with incorrect username and/or incorrect password' do
  end

  scenario 'Logging in with correct username and password' do
  end

end

def login_user
  @user = User.create(email: "user1@test.com", password:"user1")
  visit root_path
  within "#login" do
    fill_in "Username", with: @user.email
    fill_in "Password", with: @user.password
  end
  click_button "Login"
end