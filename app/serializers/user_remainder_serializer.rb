class UserRemainderSerializer < UserSerializer
  def include_username?; false; end
  def include_balance?; false; end
  def include_id?; false; end
end
