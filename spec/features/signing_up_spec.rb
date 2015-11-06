require 'rails_helper'

feature 'Signing up a new user' do
  
  background do
    User.create(first_name: 'user', last_name: '1', email: 'user1@test.com', password: 'user1')
  end

  scenario 'Signing up with no email and no password' do
    visit signup_path
    within ("form") do 
      fill_in 'First name', with: ''
      fill_in 'Last name', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
    end
    click_button 'Signup'
    expect(page).to have_content 'First name can\'t be blank'
    expect(page).to have_content 'Last name can\'t be blank'
    expect(page).to have_content 'Email can\'t be blank'
    expect(page).to have_content 'Password can\'t be blank'
  end

  scenario 'Signing up with non-unique email' do
    visit signup_path
    within ("form") do
      fill_in 'First name', with: 'user'
      fill_in 'Last name', with: '1'
      fill_in 'Email', with: 'user1@test.com'
      fill_in 'Password', with: 'user1'
    end
    click_button 'Signup'
    expect(page).to have_content 'Email has already been taken'
  end

  scenario 'Signing up successfully' do
    visit signup_path
    within ("form") do
      fill_in 'First name', with: 'user'
      fill_in 'Last name', with: '2'
      fill_in 'Email', with: 'user2@test.com'
      fill_in 'Password', with: 'user2'
    end
    click_button 'Signup'
    expect(page).to have_content 'Successfully signed up!'
  end

end