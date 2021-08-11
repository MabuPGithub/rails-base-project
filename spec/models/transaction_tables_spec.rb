require 'rails_helper'

RSpec.describe TransactionTable, :type => :model do
    let!(:transaction){TransactionTable.new}

    context 'Validations' do
        it 'is not valid without transaction_text' do
            transaction.transaction_text = 'MSFT'
            transaction.transction_type = 'BUY'
            transaction.user_id = 1

            expect(transaction).to be_valid
            expect(transaction.errors).to_not be_present

        end
        it 'is not valid without transction_type and user_id' do
            transaction.transaction_text = 'MSFT'
            transaction.transction_type = nil
            transaction.user_id = nil

            expect(transaction).to_not be_valid
            expect(transaction.errors).to be_present
        end

        describe "Associations to user" do
            it { belong_to(:user) }
        end

    end


end