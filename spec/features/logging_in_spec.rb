require 'rails_helper'

feature 'Logging in a user' do
  
  background do
    visit login_path
  end

  scenario 'Logging in with no username and no password' do
    within '#login' do
      fill_in 'Username', with: ''
      fill_in 'Password', with: ''
    end
    click_button 'Login'
    expect(page.current_path).to eq login_path
    expect(page).to have_content 'Please enter a username and password'
  end

  scenario 'Logging in with incorrect username and/or incorrect password' do
    within '#login' do
      fill_in 'Username', with: 'user1@test.com'
      fill_in 'Password', with: 'user111'
    end
    click_button 'Login'
    expect(page.current_path).to eq login_path
    expect(page).to have_content 'Incorrect username or password'
  end

  scenario 'Logging in with correct username and password' do
    login_user
    expect(page.current_path).to eq @user # @user = profile page
    expect(page).to have_content 'Welcome back'
  end

end

feature 'Logging out a user' do

  scenario 'User logs out' do
    login_user
    expect(page.current_path).to eq @user
    click_button 'Logout'
    expect(page.current_path).to eq root_path
  end

end

feature 'Authorization for logged-in users' do

  background do
    login_user
  end

  scenario 'Trying to access signup page while logged in' do
    visit signup_path
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'You already have an account'
  end

  scenario 'Trying to access login page while logged in' do
    visit login_path
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'You are already logged in'
  end

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

def create_item
  @item = Item.create(
    name: 'Item1', 
    pic_url: 'Item1.jpg', 
    description: 'First item',
    price: 9.99)
end

def logout
  click 'Logout'
end



