
require 'rails_helper'

feature "Forgotten passwords" do
  let(:user){ User.create(email:"test@test.com", password:"testing", profilepic_url: "testpic") }

  before {visit login_path}

  scenario "sends a user a single email" do
    click_link "Forgot your password?"
    fill_in "Email", with: user.email
    click_button "Reset Password"
    expect {ActionMailer::Base.deliveries.count.to eq(1)}
  end

  scenario "resets a password when following the email link" do
    # send password reset email and go to change password form
    click_link "Forgot your password?"
    fill_in "Email", with: user.email
    click_button "Reset Password"
    open_email(user.email)
    current_email.click_link "here"
    expect(page).to have_content("Change Your Password")

    # fill in the form successfully
    fill_in "Password", with: "mynewpassword1"
    click_button "Reset Password"
    expect(page).to have_content("Password updated.")
    expect(page.current_path).to eq(root)

    # logout and log back in using the new password
    click_link "Sign Out"
    expect(page).to have_content("Logged out")
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "mynewpassword1"
    click_button "Log In"
    expect(page).to have_content("Welcome back #{user.email}!")
  end
end