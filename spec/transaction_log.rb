require 'transaction'

DEPOSIT_LOG = '01/01/1970 || 100.00 || || 1100.00'
WITHDRAW_LOG = '01/01/1970 || || 100.00 || 900.00'

describe Transaction do
  subject(:test_deposit) { described_class.new Date.new(1970,1,1), 100, 1100 }
  subject(:test_withdrawal) { described_class.new Date.new(1970,1,1), -100, 900 }

  describe '#to_s' do

    it 'returns a valid string for a deposit' do
      expect(test_deposit.to_s).to eq DEPOSIT_LOG
    end

    it 'returns a valid string for a withdrawal' do
      expect(test_withdrawal.to_s).to eq WITHDRAW_LOG
    end

  end

end
