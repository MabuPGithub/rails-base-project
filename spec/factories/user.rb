require "rails_helper"

FactoryBot.define do
    factory :user do
        id {1}
        name {'Jon'}
        email {'jondoe123@test.com'}
        password {'123123'}
        password_confirmation {'123123'}
        approved { true }
        confirmed_at { '2021-08-12' }
    end
end