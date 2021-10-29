class UserExpense < ApplicationRecord
  belongs_to :user

  validates :price, presence:true, numericality: {only_float: true}
  validates :category, presence: true

end
