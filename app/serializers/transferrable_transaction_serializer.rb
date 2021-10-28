class TransferrableTransactionSerializer < ActiveModel::Serializer
  attributes :id, :transactor_id, :transactee_id, :cost, :category, :confirmed, :transaction_to_user
end
