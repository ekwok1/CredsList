require 'rails_helper'

feature 'Logging in a user' do
  
  background do
    visit login_path
  end

  scenario 'No email and no password' do
    within 'form' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
    end
    click_button 'Login'
    expect(page.current_path).to eq login_path
    expect(page).to have_content 'Please enter an email and password'
  end

  scenario 'Incorrect email and/or incorrect password' do
    within 'form' do
      fill_in 'Email', with: 'user1@test.com'
      fill_in 'Password', with: 'user111'
    end
    click_button 'Login'
    expect(page.current_path).to eq login_path
    expect(page).to have_content 'Incorrect email or password'
  end

  scenario 'Correct email and password' do
    login_user
    expect(page.current_path).to eq user_path(@user) # @user = profile page
    expect(page).to have_content 'Welcome back'
  end

end

feature 'Logging out a user' do

  scenario 'User logs out' do
    login_user
    expect(page.current_path).to eq user_path(@user)
    click_link 'Logout'
    expect(page.current_path).to eq root_path
  end

end

feature 'Authorization for logged-in users' do

  background do
    login_user
  end

  scenario 'Trying to access signup page while logged in' do
    visit signup_path
    expect(page.current_path).to eq user_path(@user)
    expect(page).to have_content 'You are already logged in'
  end

  scenario 'Trying to access login page while logged in' do
    visit login_path
    expect(page.current_path).to eq user_path(@user)
    expect(page).to have_content 'You are already logged in'
  end

end

def login_user
  @user = User.create(first_name: 'user', last_name: '1', email: 'user1@test.com', password: 'user1')
  visit login_path
  within 'form' do
    fill_in 'Email', with: @user.email
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
  click_link 'Logout'
end



