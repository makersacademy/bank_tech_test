require 'account'
require 'date'

describe Account do

  subject(:account) { described_class.new(history: history) }

  let(:history) { instance_spy("History") }

  let(:today) { Date.today }

  it "records a deposit" do
    account.deposit(100, today)
    # p account.history
    expect(history).to have_received(:deposit).with(100, today)
  end

  it "records a withdrawl" do
    account.withdraw(50, today)
    expect(history).to have_received(:withdraw).with(50, today)
  end

end
