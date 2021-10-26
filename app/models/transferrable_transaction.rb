class TransferrableTransaction < ApplicationRecord
  belongs_to :transactor, foreign_key: "transactor_id", class_name: "User"
  belongs_to :transactee, foreign_key: "transactee_id", class_name: "User"
end
