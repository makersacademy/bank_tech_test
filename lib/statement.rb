class Statement

  attr_reader :information

  def initialize
    @information = {}
    @dates = []
  end

  def input(date, amount, balance)
    @dates.push(date)
    @information[date] = {amount: amount, balance: balance}
  end

  def print_out
    output = "date || credit || debit || balance \n"
    @dates.sort!.reverse!
    @dates.each do |date|
      if @information[date][:amount] > 0
        output = output + generate_credit_line(date)
      else
        output = output + generate_debit_line(date)
      end
    end
    output
  end

  def generate_credit_line(date)
    date + " || " + sprintf("%.2f", @information[date][:amount]) + " || || " + sprintf("%.2f", @information[date][:balance]) +" \n"
  end

  def generate_debit_line(date)
    date + " || || " + sprintf("%.2f", -@information[date][:amount]) + " || " + sprintf("%.2f", @information[date][:balance]) +" \n"
  end

end
