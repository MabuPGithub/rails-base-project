require "rails_helper"

RSpec.feature "User VIEW ALL STOCK feature", :type => :feature do
  scenario "User LOGIN then, VIEW ALL STOCK" do
    user = create(:user) 
    sign_in user
    visit root_path

    click_link('My Porfolio')
    expect(page).to have_text("My Stock Porfolio")
    
    stock = create(:my_stock, user_id: user.id)

    visit stock_view_my_stocks_path
    expect(page).to have_text("MSFT")
  end
end