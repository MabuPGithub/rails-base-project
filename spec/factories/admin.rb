require "rails_helper"

FactoryBot.define do
    factory :admin do
        email {'admin@test.com'}
        password {'123456'}
        password_confirmation {'123456'}
    end
end