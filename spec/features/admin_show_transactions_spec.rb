require 'rails_helper'

RSpec.feature "Admin show all transactions", type: :feature do

    scenario "Admin logs in to access the index page and show all transactions" do 
        admin = create(:admin) 
        sign_in admin
        visit admin_root_url

        expect(current_path).to eql('/admins')

        visit admin_transaction_list_url

        expect(current_path).to eql('/admins/transaction_list')
    end

end