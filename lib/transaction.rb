class Transaction

  attr_reader :date

  def initialize(amount, date = Date.new)
    @date = date
  end

end
