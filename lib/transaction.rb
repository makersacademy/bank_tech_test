require 'Date'

class Transaction
  attr_reader :credit, :debit, :date
  attr_accessor :current_balance

  def initialize(credit: nil,
                 debit: nil,
                 date: date)
    @credit = credit
    @debit = debit
    @date = date
  end
end
