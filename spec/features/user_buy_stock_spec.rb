require "rails_helper"

RSpec.feature "User BUY A STOCK feature", :type => :feature do
  scenario "User login then, pick a stock then, buy a stock" do
    # SIGN IN
    user = create(:user) 
    sign_in user
    visit root_path
    # PICK A STOCK
    visit stock_view_show_path("MSFT")
    expect(page).to have_text("Microsoft Corporation")

    # BUY A STOCK
    fill_in 'mystock[stock_count_bought]', with: '10'
    find('input[type="submit"]').click

    expect(page).to have_text("My Stock Porfolio")  
    expect(page).to have_text("Stock Count: 10")


    # visit new_user_session_path
    # fill_in 'user[email]', with: 'jon@test.com'
    # fill_in 'user[password]', with: '123123'

    # find('input[name="commit"]').click

    # expect(page).to have_text("Stocks Price Today")
    # expect(page).to have_text("Logout")
    
    # BUY A STOCK PART
    # 1. visit MSFT stock page
    # visit stock_view_show_path("MSFT")

    # expect(page).to have_text("Ticker: MSFT")
    # expect(page).to have_text("Microsoft Corporation")

  end
end 