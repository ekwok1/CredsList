require 'rails_helper'

feature 'Logging in a user' do
  
  background do
    visit root_path
  end

  scenario 'Logging in with no username and no password' do
    within '#login' do
      fill_in 'Username', with: ''
      fill_in 'Password', with: ''
    end
    click_button 'Login'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Please enter a username and password'
  end

  scenario 'Logging in with incorrect username and/or incorrect password' do
    within '#login' do
      fill_in 'Username', with: 'user1@test.com'
      fill_in 'Password', with: 'user111'
    end
    click_button 'Login'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Incorrect username or password'
  end

  scenario 'Logging in with correct username and password' do
    login_user
    expect(page.current_path).to eq home_path
    expect(page).to have_content 'Welcome back'
  end

end

feature 'Logging out a user' do
  login_user
  expect(page.current_path).to eq home_path
  click_button 'Logout'
  expect(page.current_path).to eq root_path
end

def login_user
  @user = User.create(email: 'user1@test.com', password: 'user1')
  visit root_path
  within '#login' do
    fill_in 'Username', with: @user.email
    fill_in 'Password', with: @user.password
  end
  click_button 'Login'
end