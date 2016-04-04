private

class Transaction

attr_reader :date, :client_account, :type, :amount

  def initialize(amount, type, account)
    @amount = amount
    @type = type
    @client_account = account
    @date = Time.now
  end

  def make
    type == :deposit ? add : subtract
    record
  end

  def record
    client_account.history << self
  end

private

  def add
    client_account.balance += amount
  end

  def subtract
    client_account.balance -= amount
  end

end
