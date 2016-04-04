require 'account'

describe Account do
  subject(:account_klass) {described_class}
  let(:dummy_transaction_klass) {double :dummy_transaction_klass}
  let(:dummy_transaction) {double :dummy_transaction}
  let(:dummy_amount) {double :dummy_amount}

  subject(:account) {described_class.new}

  describe '#initialize' do

    it 'has a new history when the account is initialized' do
      expect(account.history).to be_empty
    end

    it 'instantiates with a balance of 0 as a default' do
      expect(account.balance).to be_zero
    end

  end

  describe '#new_action' do

    before do
      allow(dummy_transaction_klass).to receive(:new)
                                    .with(dummy_amount, :deposit, account)
                                    .and_return(dummy_transaction)
      allow(dummy_transaction).to receive(:make)
    end

    it 'calls make on a new instance of action, defaulting to Transaction' do
      expect(dummy_transaction).to receive(:make)
      account.new_action(dummy_amount, :deposit, dummy_transaction_klass)
    end
  end
end
