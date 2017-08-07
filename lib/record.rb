class Record
  attr_reader :amount, :date, :type

  def initialize(amount, date)
    @amount = amount
    @date = date
    @type = nil
  end

  def add_to(ledger)
    ledger.transactions << format_record
  end

  def format_record
    { amount: @amount, date: @date }
  end
end
