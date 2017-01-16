require 'spec_helper'

describe Account do
  let!(:deposit) do
    double('deposit', value: 100, created_date: Date.today.to_s)
  end

  let!(:withdrawl) do
    double('withdrawl', value: 100, created_date: Date.today.to_s)
  end

  it 'has an opening balance of zero' do
    expect(subject.current_balance).to eq(0)
  end

  it 'can make a deposit' do
    subject.deposit(deposit)
    expect(subject.current_balance).to eq(100)
  end

  it 'stores the deposit with the new balance' do
    subject.deposit(deposit)
    expect(subject.transaction_record).to eq([[deposit, 100]])
  end

  it 'can make a withdrawl' do
    subject.withdraw(withdrawl)
    expect(subject.current_balance).to eq(-100)
  end

  it 'stores the withdrawl with new balance' do
    subject.withdraw(withdrawl)
    expect(subject.transaction_record).to eq([[withdrawl, -100]])
  end
end
