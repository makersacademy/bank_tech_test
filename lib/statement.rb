class Statement

  def initialize
    @information = {}
    @dates = []
  end

  def input(date, amount, balance)
    @dates.push(date)
    @information[date] = {amount: amount, balance: balance}
  end

  def print_out
    output = "date || credit || debit || balance\n"
    order_dates_array
    output = iterate_dates(output)
  end

  private

  def order_dates_array
    @dates.sort!.reverse!
  end

  def iterate_dates(output)
    @dates.each do |date|
      output = output + generate_credit_line(date) if @information[date][:amount] > 0
      output = output + generate_debit_line(date) if @information[date][:amount] < 0
    end
    output
  end

  def generate_credit_line(date)
    date.strftime("%d/%m/%Y") + " || " + sprintf("%.2f", @information[date][:amount]) + " || || " + sprintf("%.2f", @information[date][:balance]) +"\n"
  end

  def generate_debit_line(date)
    date.strftime("%d/%m/%Y") + " || || " + sprintf("%.2f", -@information[date][:amount]) + " || " + sprintf("%.2f", @information[date][:balance]) +"\n"
  end

end
