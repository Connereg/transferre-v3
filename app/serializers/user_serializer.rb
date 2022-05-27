class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :balance, :remainder

  def balance
    expenses = self.object.user_expenses.map{|expense| expense.cost}.sum
    subtraction_total = 0
    addition_total = 0
    
    self.object.transactee_transactions.map do |transaction|
      if transaction.transaction_to_user == false
        subtraction_total += transaction.cost
      elsif transaction.transaction_to_user and transaction.confirmed
        addition_total += transaction.cost
      else 
        "pending"
      end
    end

    self.object.transactor_transactions.map do |transaction|
      if transaction.transaction_to_user == false
        addition_total += transaction.cost
      elsif transaction.transaction_to_user and transaction.confirmed
        subtraction_total += transaction.cost
      else 
        "pending"
      end
    end


    (self.object.balance - expenses + addition_total - subtraction_total).truncate(2)
  end

end
