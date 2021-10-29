class UserExpense < ApplicationRecord
  belongs_to :user

  def balance
    self.user.balance
  end
end
