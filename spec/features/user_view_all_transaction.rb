require "rails_helper"

RSpec.feature "User VIEW ALL TRANSACTION", :type => :feature do
  scenario "User LOGIN then, VIEW ALL TRANSACTIONS" do
    user = create(:user) 
    sign_in user
    visit root_path

    click_link('Latest Transaction')
    expect(page).to have_text("My Transactions")
  end
end