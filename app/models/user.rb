class User < ApplicationRecord
    has_many :user_expenses
    has_many :transactor_transactions, foreign_key: "transactor_id", class_name: "Transferrable_Transaction" 
	has_many :tranactors, through: :transactor_transactions, source: :transactor

    has_many :transactee_transactions, foreign_key: "transactee_id", class_name: "Transferrable_Transaction" 
	has_many :tranactees, through: :transactee_transactions, source: :transactee
end
