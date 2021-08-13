require 'rails_helper'

RSpec.feature "Admin create user", type: :feature do

    scenario "Admin logs in to access the index page and creates a user" do 
        admin = create(:admin) 
        sign_in admin
        visit admin_root_url

        expect(current_path).to eql('/admins')

        visit new_admin_path

        expect(current_path).to eql('/admins/new')

        fill_in 'user[name]', with: 'Myles'
        fill_in 'user[email]', with: 'myles@email.com'
        find('input[name="commit"]').click

        expect(current_path).to eql('/admins')
    end
end