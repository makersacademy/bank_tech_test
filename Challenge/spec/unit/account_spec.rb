require 'account'

describe Account do

    it 'can return the funds currently in the account' do
      expect(subject.balance).to eq(0)
    end

    it 'can accept deposits that increase the #balance' do
      subject.deposit('10/01/2012', 1000)
      expect(subject.balance).to eq(1000)
    end

    it 'has #print_statement that prints a table' do
      expect(subject.print_statement).to eq('date || credit || debit || balance')
    end
end
