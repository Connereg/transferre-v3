class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :balance, :remainder

  def balance
    expenses = self.object.user_expenses.map{|expense| expense.cost}.sum
    self.object.balance - expenses
  end

end
