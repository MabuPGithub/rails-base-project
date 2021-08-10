require 'rails_helper'

RSpec.describe MyStock, :type => :model do
    
    subject { MyStock.new }

    it "is valid with valid attributes" do
        subject.stock_name_bought = "Test"
        subject.stock_count_bought = 10
        subject.stock_price_bough = 100.00
        subject.user_id = 1
        expect(subject).to be_valid
    end

    it "is not valid without a stock_name_bought" do
        my_stock = MyStock.new(stock_name_bought: nil)
        expect(MyStock.new).to_not be_valid
    end

    it "is not valid without a stock_price_bough"

    it "is not valid without a stock_count_bought"
end