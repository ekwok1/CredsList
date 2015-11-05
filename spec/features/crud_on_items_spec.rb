require 'rails_helper'

feature 'R in CRUD: reading items' do

  scenario 'Accessing items while not logged in' do
    visit root_path
    expect(page.current_path).to eq root_path
  end

  scenario 'Accessing items while logged in' do
    login_user
    visit root_path
    expect(page.current_path).to eq root_path
  end

end

feature 'C in CRUD: creating items' do

  scenario 'Trying to create items while not logged in' do
    click_button 'Create Item' # can we change this to Create Listing?
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'You need to be logged in to create a listing'
  end

  scenario 'Creating item while logged in ' do
    login_user
    visit new_item_path
    within 'form' do
      fill_in 'Name', with: 'Item 1'
      fill_in 'Picture URL', with: 'Item1.jpg'
      fill_in 'Descrption', with: 'First item'
      fill_in 'Price', with: 9.99
    end
    click_button 'Create Item'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Item successfully created'
    expect(page).to have_content 'Item 1'
  end

end

feature 'U in CRUD: updating items' do

  background do
    login_user
    create_item
    logout
  end

  scenario 'Trying to update items while not logged in' do
    visit edit_item_path(@item)
    expect(page.current_path).to eq login_path
    expect(page).to have_content 'You must be logged in to update listings'
  end

  scenario 'Trying to update items that are not yours' do
    login_user_2
    visit edit_item_path(@item)
    click_button 'Edit Item'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'You are not authorized to edit this listing'
  end

  scenario 'Updating items that belong to correct user' do
    login_user
    visit edit_item_path(@item)
    within 'form' do
      fill_in 'Name', with: 'Item 111'
    end
    click_button 'Edit Item'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Successfully updated listing'
    expect(page).to have_content 'Item 111'
  end

end

feature 'D in CRUD: deleting items' do

  background do
    login_user
    create_item
    logout
  end

  scenario 'Trying to delete items while not logged in' do
    visit @item
    click_button 'Delete'
    expect(page.current_path).to eq login_path
    expect(page).to have_content 'You need to be logged in to delete a listing'
  end

  scenario 'Trying to delete items that are not yours' do
    login_user_2
    visit @item
    click_button 'Delete'
    expect(page.current_path).to eq @item
    expect(page).to have_content 'You are not authorized to delete this listing'
  end

  scenario 'Deleting items that are yours' do
    login_user
    visit @item
    click_button 'Delete'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Successfully deleted listing'
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

def login_user_2
  @user = User.create(email: 'user2@test.com', password: 'user2')
  visit root_path
  within '#login' do
    fill_in 'Username', with: @user.email
    fill_in 'Password', with: @user.password
  end
  click_button 'Login'
end

def logout
  click 'Logout'
end

def create_item
  @item = Item.create(
    name: 'Item1', 
    pic_url: 'Item1.jpg', 
    description: 'First item',
    price: 9.99)
end