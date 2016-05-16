class Statement

  attr_reader :transaction_log
  STATEMENT_HEADER = "date || credit || debit || balance"

  def initialize(transaction_log)
    @transaction_log = transaction_log
  end

  def view_statement(start_balance:balance=0, withdrawals:withdrawals=true, deposits:deposits=true, ascending: ascending=false)
    statement = ""
    transaction_log.transactions.each do |transaction|
      balance = update_balance(balance, transaction)
      statement = update_statement(statement, transaction, balance, ascending) if chosen?(transaction, withdrawals, deposits)
    end
    fix_look(statement)
  end

  private

  def chosen?(transaction, withdrawals, deposits)
    (transaction.is_deposit? == deposits || transaction.is_withdrawal? == withdrawals)
  end

  def fix_look(statement)
    statement = STATEMENT_HEADER + statement
    statement.gsub!(" 0.00 ", " ")
    statement
  end

  def update_balance(balance, transaction)
    '%.2f' % (balance.to_i + transaction.calculate_change.to_i)
  end

  def update_statement(statement, transaction, balance, ascending)
    return statement + format_information(transaction, balance) if ascending
    format_information(transaction, balance) + statement
  end

  def format_information(transaction, balance)
    "\n#{transaction.date.strftime("%Y/%m/%d")} || #{transaction.credit} || #{transaction.debit} || #{balance}"
  end

end
