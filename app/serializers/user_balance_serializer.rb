class UserBalanceSerializer < UserSerializer
  def include_username?; false; end
  def include_remainder?; false; end
  def include_id?; false; end
end
