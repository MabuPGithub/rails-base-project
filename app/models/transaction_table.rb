class TransactionTable < ApplicationRecord

    validates_presence_of :transaction_text
    validates_presence_of :transction_type
    validates_presence_of :user_id

    belongs_to :user, optional: true
end
