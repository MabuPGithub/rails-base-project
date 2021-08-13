require "rails_helper"

FactoryBot.define do
    factory :user do
        name {'Jon'}
        email {'jondoe123@test.com'}
        password {'123123'}
        password_confirmation {'123123'}
        approved { true }
        confirmed_at { '2021-08-12' }
    end

    factory :my_stock do
        stock_name_bought {'MSFT'}
        stock_count_bought { 10 }
        stock_price_bough { 99.00 }
        user_id { 1 }
    end
end