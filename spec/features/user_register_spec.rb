require "rails_helper"

RSpec.feature "User Register feature", :type => :feature do
  scenario "User goes to website then register" do
    
    visit new_user_registration_path
    fill_in 'user[name]', with: 'Jon Doe 1'
    fill_in 'user[email]', with: 'jondoe@test1.com'
    fill_in 'user[password]', with: '123123'
    fill_in 'user[password_confirmation]', with: '123123'

    # find('input[name="commit"]').click
    find('input[value="Sign up"]').click
    expect(current_path).to eql(new_user_session_path)
    expect(page).to have_text("Forgot your password?")
  end
end