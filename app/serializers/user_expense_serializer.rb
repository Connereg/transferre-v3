class UserExpenseSerializer < ActiveModel::Serializer
  attributes :id, :cost, :category, :created_at

  def created_at
    "#{self.object.created_at[:month]} - #{self.object.created_at[:day]} - #{self.object.created_at[:year]}"
  end
end
