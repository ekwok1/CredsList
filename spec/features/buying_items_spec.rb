require 'rails_helper'

feature 'Authorization for buying items' do

  background do
    login_user
    create_item
    logout
  end

  scenario 'Trying to buy while logged out' do
    visit item_path(@item)
    click_button 'Buy Now'
    expect(page.current_path).to eq login_path
    expect(page).to have_content 'You need to be logged in to buy this item'
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

