require 'forwardable'
class User
  attr_reader :account
  
  extend Forwardalbe

  def_delegators :account, :first_name, :last_name

#  def initialize(account)
#    @account = account
#  end

#  def first_name
#   account.first_name
#  end
#
#  def last_name
#    account.last_name
#  end
#
  def full_name
    "#{first_name} #{last_name}"
  end
end
