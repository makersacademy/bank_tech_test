describe Transactions do

  let(:transactions) { Transactions.new }
  let(:money_tracker) { MoneyTracker.new }

  it { is_expected.to respond_to(:store_transaction).with(2).arguments }
  it { is_expected.to respond_to(:format_statement) }

  describe "#initialise" do
    it "should initialise with an empty list" do
      expect(transactions.list).to eq []
    end
  end

  describe "#store_transaction" do
    it "should store a transaction in list" do
      transactions.store_transaction(20, 20)
      expect(transactions.list).to eq([{:date=>date, :amount=>20, :balance=>20}])
    end
  end

  describe "#format_header" do
    it "should return header for statement" do
      expect{transactions.format_header}.to output("Date || Transaction || Balance\n").to_stdout
    end
  end

  describe "#format_statement" do
      it "should return a list of transactions" do
        money_tracker.earn(30)
        money_tracker.spend(10)
      expect(money_tracker.transactions.format_statement).to eq [{:date=>date, :amount=>30, :balance=>30}, {:date=>date, :amount=>-10, :balance=>20}]
    end
  end
end
