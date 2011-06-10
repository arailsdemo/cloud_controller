describe UserToken do
  let(:klass) { UserToken }

  describe ".create" do
    it "returns a new token with the current time + 1 week" do
      Timecop.freeze
      token = klass.create('foo@bar.com')
      token.valid_until.should == (Time.now.utc + 1.week).to_i
      Timecop.return
    end
  end
end
