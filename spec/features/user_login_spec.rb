require "rails_helper"

RSpec.feature "User LOGIN feature", :type => :feature do
  scenario "User LOGIN then find STOCKS PRICE TODAY:" do
    user = create(:user) 
    sign_in user
    visit root_path

    expect(current_path).to eql(root_path)
    expect(page).to have_text("Logout")
    expect(page).to have_text("Stocks Price Today:")

  end
end