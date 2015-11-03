require 'rails_helper'

feature 'R in CRUD: reading items' do

  scenario 'accessing items while not logged in' do
    visit home_path
    expect(page.current_path).to eq home_path
  end

  scenario 'accessing items while logged in' do
    login_user
    visit home_path
    expect(page.current_path).to eq home_path
  end

end

feature 'C in CRUD: creating items' do

end

feature 'U in CRUD: updating items' do

end

feature 'D in CRUD: deleting items' do

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