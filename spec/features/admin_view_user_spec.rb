require 'rails_helper'

RSpec.feature "Admin view user", type: :feature do

    scenario "Admin logs in to access the index page and views a user" do 
        admin = create(:admin) 
        sign_in admin
        visit admin_root_url

        expect(current_path).to eql('/admins')
        user = create(:user)
        
        visit admin_path(user.id)

        expect(current_path).to eql("/admins/#{user.id}")
    end
end