require 'rails_helper'

RSpec.describe MyStock, :type => :model do
    # before :each do
    #     user = User.make
    # end

    subject {MyStock.new(
        stock_name_bought: "Test",
        stock_count_bought: 1,
        stock_price_bough: 100.00,
        user_id: 1)}
    
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without a stock_name_bought" do
        subject.stock_name_bought = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a stock_price_bough" do
        subject.stock_price_bough = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a stock_count_bought" do
        subject.stock_count_bought = nil
        expect(subject).to_not be_valid
    end

    describe "Associations to user" do
        it { belong_to(:user) }
    end
end