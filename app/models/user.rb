class User < ApplicationRecord
   #to checkout encrypted password once a user is created run $user.password_digest
   has_secure_password

   has_many :user_expenses
   
   has_many :transactor_transactions, foreign_key: "transactor_id", class_name: "Transferrable_Transaction"
   has_many :transactors, through: :transactor_transactions, source: :transactor
 
   has_many :transactee_transactions, foreign_key: "transactee_id", class_name: "Transferrable_Transaction"
   has_many :transactees, through: :transactee_transactions, source: :transactee

   
end
